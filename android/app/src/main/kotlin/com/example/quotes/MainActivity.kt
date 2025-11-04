package com.example.quotes

import android.content.Context
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.EventChannel
import kotlin.math.sqrt

class MainActivity : FlutterActivity(), SensorEventListener, EventChannel.StreamHandler {
    private val TAG = "ShakeMain"
    private val EVENT_CHANNEL = "com.example.shake/events"

    private var sensorManager: SensorManager? = null
    private var accelerometer: Sensor? = null

    // EventChannel sink to send shake events to Flutter
    private var eventSink: EventChannel.EventSink? = null

    // Shake detection params
    private var lastShakeTimestamp = 0L
    private val SHAKE_DEBOUNCE_MS = 600L
    private val SHAKE_THRESHOLD = 12.0f // tune this (m/s^2)

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        sensorManager = getSystemService(Context.SENSOR_SERVICE) as SensorManager
        accelerometer = sensorManager?.getDefaultSensor(Sensor.TYPE_ACCELEROMETER)
        EventChannel(flutterEngine?.dartExecutor?.binaryMessenger, EVENT_CHANNEL).setStreamHandler(this)
    }

    override fun onResume() {
        super.onResume()
        accelerometer?.also { sensor ->
            sensorManager?.registerListener(this, sensor, SensorManager.SENSOR_DELAY_UI)
        }
    }

    override fun onPause() {
        super.onPause()
        sensorManager?.unregisterListener(this)
    }

    // SensorEventListener
    private var lastX = 0f
    private var lastY = 0f
    private var lastZ = 0f
    private var lastUpdate = 0L

    override fun onAccuracyChanged(p0: Sensor?, p1: Int) {}

    override fun onSensorChanged(event: SensorEvent?) {
        if (event?.sensor?.type != Sensor.TYPE_ACCELEROMETER) return

        val x = event.values[0]
        val y = event.values[1]
        val z = event.values[2]

        val now = System.currentTimeMillis()
        // simple rate limit
        if (now - lastUpdate > 50) {
            val diff = now - lastUpdate
            // compute speed = change / time
            val deltaX = x - lastX
            val deltaY = y - lastY
            val deltaZ = z - lastZ

            val delta = sqrt(deltaX * deltaX + deltaY * deltaY + deltaZ * deltaZ)
            val speed = delta / diff * 1000 // scaled

            // Basic threshold check
            if (speed > SHAKE_THRESHOLD) {
                if (now - lastShakeTimestamp > SHAKE_DEBOUNCE_MS) {
                    lastShakeTimestamp = now
                    Log.d(TAG, "Shake detected (speed=$speed)")
                    eventSink?.success("onShakeDetected")
                }
            }

            lastUpdate = now
            lastX = x
            lastY = y
            lastZ = z
        }
    }

    override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
        eventSink = events
    }

    override fun onCancel(arguments: Any?) {
        eventSink = null
    }


}
