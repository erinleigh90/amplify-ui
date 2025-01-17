import React from 'react';
import { StyleSheet, View } from 'react-native';

import { Authenticator } from '@aws-amplify/ui-react-native';
import { TextField } from '@aws-amplify/ui-react-native/dist/primitives';
import { Amplify } from 'aws-amplify';

import { SignOutButton } from '../SignOutButton';
import awsconfig from './aws-exports';

Amplify.configure({
  ...awsconfig,
  Auth: { endpoint: 'http://127.0.0.1:9091/' },
});

function App() {
  return (
    <Authenticator.Provider>
      <Authenticator
        initialState="signUp"
        components={{
          ForceNewPassword: ({ fields, ...props }) => (
            <>
              <Authenticator.ForceNewPassword {...props} fields={fields} />
              <TextField label="Zone Info" placeholder="Zone Info"></TextField>
            </>
          ),
        }}
      >
        <View style={style.container}>
          <SignOutButton />
        </View>
      </Authenticator>
    </Authenticator.Provider>
  );
}

const style = StyleSheet.create({
  container: { flex: 1, alignItems: 'center', justifyContent: 'center' },
});

export default App;
