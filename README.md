# NxCar Demo

NxCar Demo is a Flutter project showcasing various screens and components for a flutter application.
It includes features such as onboarding, login, OTP verification.

## Screens

### OnboardingScreen

The `OnboardingScreen` introduces users to the app's features and benefits through a series of
slides. Users can swipe through the slides and proceed to the next screen.

#### Components

- `OnboardingScreenCubit`: Manages the state and logic for the onboarding screen.
- `IconPositions`: Enum defining different positions for icons on the onboarding screen.
- `AppAssetsName`: Contains asset names used in the app.

### LoginScreen

The `LoginScreen` allows users to log in to their account or create a new one. It includes input
fields for phone number, name, email, and vehicle number.

#### Components

- `LoginScreenCubit`: Manages the state and logic for the login screen.
- `AppToolbar`: Toolbar component for navigation.
- `AppTextField`: Custom text field widget for input fields.
- `VehicleNumberFormatter`: Formatter for vehicle number input field.

### OTPScreen

The `OTPScreen` is used for OTP verification. Users receive a one-time password on their phone
number and enter it to proceed.

#### Components

- `OTPScreenCubit`: Manages the state and logic for the OTP screen.
- `AppToolbar`: Toolbar component for navigation.
- `AppButton`: Custom button widget.
