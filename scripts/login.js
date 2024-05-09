new Vue({
    el: '#app',
    data: {
        isSignIn: true,
        email: '',
        password: '',
        confirmPassword: '',
        dob: '',
        mobile: '',
        showPassword: false
    },
    methods: {
        toggleForm() {
            this.isSignIn = !this.isSignIn;
            this.clearFields();
        },
        clearFields() {
            this.email = '';
            this.password = '';
            this.confirmPassword = '';
            this.dob = '';
            this.mobile = '';
            this.showPassword = false;
        },
        signIn() {
            // Implement your sign in logic here
            console.log('Signing in...');
        },
        signUp() {
            // Implement your sign up logic here
            console.log('Signing up...');
        },
        togglePasswordVisibility() {
            console.log('Toggling password visibility...');
            this.showPassword = !this.showPassword;
            console.log('showPassword:', this.showPassword);
        }
    }
});
