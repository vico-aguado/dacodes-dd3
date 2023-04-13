package com.example.dacodes_dd3;
import dev.flutter.plugins.integration_test.FlutterTestRunner;
import org.junit.Rule;
import org.junit.Test;
import org.junit.runner.RunWith;
import pl.leancode.patrol.PatrolTestRule;
import pl.leancode.patrol.PatrolTestRunner;
import com.example.dacodes_dd3.MainActivity;

@RunWith(PatrolTestRunner.class)
public class MainActivityTest {
    @Rule
    public PatrolTestRule<MainActivity> rule = new PatrolTestRule<>(MainActivity.class);
}