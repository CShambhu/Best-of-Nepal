// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(authRepository)
final authRepositoryProvider = AuthRepositoryProvider._();

final class AuthRepositoryProvider
    extends
        $FunctionalProvider<
          AuthRepositories,
          AuthRepositories,
          AuthRepositories
        >
    with $Provider<AuthRepositories> {
  AuthRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authRepositoryHash();

  @$internal
  @override
  $ProviderElement<AuthRepositories> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AuthRepositories create(Ref ref) {
    return authRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AuthRepositories value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AuthRepositories>(value),
    );
  }
}

String _$authRepositoryHash() => r'5e07e241c35aa413a0f4de7f85496469e214ecbe';

@ProviderFor(authState)
final authStateProvider = AuthStateProvider._();

final class AuthStateProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserModel?>,
          UserModel?,
          Stream<UserModel?>
        >
    with $FutureModifier<UserModel?>, $StreamProvider<UserModel?> {
  AuthStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'authStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$authStateHash();

  @$internal
  @override
  $StreamProviderElement<UserModel?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<UserModel?> create(Ref ref) {
    return authState(ref);
  }
}

String _$authStateHash() => r'd4386d005e474363cd4928e10f167abf49151d6a';
