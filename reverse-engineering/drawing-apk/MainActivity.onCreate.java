    /* JADX WARN: Multi-variable type inference failed */
    @Override // defpackage.pm, androidx.fragment.app.FragmentActivity, androidx.activity.ComponentActivity, androidx.core.app.ComponentActivity, android.app.Activity
    public final void onCreate(Bundle bundle) {
        ViewPager2 viewPager2;
        Bundle extras;
        Bundle extras2;
        Bundle extras3;
        super.onCreate(bundle);
        setContentView(R.layout.main);
        i93 i93Var = UptodownApp.M;
        if (i93.m(this)) {
            startActivity(new Intent(this, (Class<?>) TvMainActivity.class));
            finish();
            return;
        }
        this.z0 = (FrameLayout) findViewById(R.id.fl_sign_in_popup);
        this.B0 = (FrameLayout) findViewById(R.id.fl_uptodown_turbo_popup);
        RelativeLayout relativeLayout = (RelativeLayout) findViewById(R.id.rl_splash);
        this.Z = relativeLayout;
        relativeLayout.getClass();
        int i = 8;
        relativeLayout.setOnClickListener(new ec(i));
        this.T = (RelativeLayout) findViewById(R.id.app_info_selected_popup);
        if (UptodownApp.h0) {
            RelativeLayout relativeLayout2 = this.Z;
            relativeLayout2.getClass();
            relativeLayout2.setVisibility(8);
        }
        this.d0 = (RelativeLayout) findViewById(R.id.rl_wizard);
        this.e0 = (RelativeLayout) findViewById(R.id.rl_wizard_placeholder);
        S();
        this.f0 = (AppBarLayout) findViewById(R.id.abl_toolbar);
        ((ImageView) findViewById(R.id.home_uptodown_logo)).setOnClickListener(new fm1(18, this));
        ((RelativeLayout) findViewById(R.id.rl_main_search_view)).setOnClickListener(new fm1(28, this));
        ((ImageView) findViewById(R.id.home_uptodown_turbo)).setOnClickListener(new im1(4, this));
        E1();
        String strH = nd0.H(this, "app_id_after_kill");
        int i2 = 5;
        int i3 = 2;
        int i4 = 3;
        int i5 = 1;
        int i6 = 0;
        Object[] objArr = 0;
        Object[] objArr2 = 0;
        Object[] objArr3 = 0;
        Object[] objArr4 = 0;
        Object[] objArr5 = 0;
        Object[] objArr6 = 0;
        Object[] objArr7 = 0;
        if (strH != null) {
            oc ocVar = new oc();
            ocVar.a = Long.parseLong(strH);
            B0(ocVar);
            nd0.X(this, "app_id_after_kill", null);
        } else if (!nd0.v(this, "wizard_completed", false)) {
            nd0.W(System.currentTimeMillis(), this, "last_sign_in_request_timestamp");
            RelativeLayout relativeLayout3 = this.e0;
            relativeLayout3.getClass();
            relativeLayout3.setOnClickListener(new ec(i));
            RelativeLayout relativeLayout4 = this.e0;
            relativeLayout4.getClass();
            relativeLayout4.setVisibility(0);
            RelativeLayout relativeLayout5 = this.d0;
            relativeLayout5.getClass();
            relativeLayout5.setVisibility(8);
            RelativeLayout relativeLayout6 = this.d0;
            relativeLayout6.getClass();
            relativeLayout6.setOnClickListener(new ec(i));
            if (nd0.N(1, this) && nd0.v(this, "gdpr_requested", false)) {
                RelativeLayout relativeLayout7 = this.d0;
                relativeLayout7.getClass();
                relativeLayout7.setVisibility(0);
                N0(f1(), 3);
                if (!nd0.N(4, this)) {
                    N0(i1(), 4);
                }
                if (!nd0.N(5, this)) {
                    if (pa3.h(this) != null) {
                        nd0.T(this, "wizard_step_5_shown", true);
                    } else {
                        N0(h1(), 5);
                    }
                }
            } else {
                N0(j1(), 1);
            }
            this.a0 = 0;
            Object obj = this.b0.get(0);
            obj.getClass();
            t1((qh3) obj);
            LifecycleCoroutineScope lifecycleScope = LifecycleOwnerKt.getLifecycleScope(this);
            ge0 ge0Var = dh0.a;
            ko1.u(lifecycleScope, ee0.a, null, new mm1(this, objArr == true ? 1 : 0, i3), 2);
        }
        runOnUiThread(new jm1(i3, this));
        i93.C(this);
        if (!nd0.v(this, "is_in_eea_checked", false)) {
            ko1.u(LifecycleOwnerKt.getLifecycleScope(this), null, null, new mm1(this, objArr7 == true ? 1 : 0, i4), 3);
        }
        if (getIntent() != null) {
            Intent intent = getIntent();
            intent.getClass();
            if ((intent.getFlags() & 1048576) != 1048576) {
                Uri data = getIntent().getData();
                if (data != null) {
                    String string = data.toString();
                    string.getClass();
                    String strC = z01.c(data, this);
                    ActivityResultLauncher activityResultLauncher = this.L0;
                    if (strC != null && tu2.W(strC, ".apk", false)) {
                        String strX = gj3.x(strC);
                        if (strX != null) {
                            ud0 ud0Var = new ud0();
                            ud0Var.c = strX;
                            LifecycleCoroutineScope lifecycleScope2 = LifecycleOwnerKt.getLifecycleScope(this);
                            ge0 ge0Var2 = dh0.a;
                            ko1.u(lifecycleScope2, dn1.a, null, new sd((Context) this, (Serializable) strX, (Object) ud0Var, (w20) (objArr6 == true ? 1 : 0), 3), 2);
                        } else {
                            Intent intent2 = new Intent(getApplicationContext(), (Class<?>) InstallerActivity.class);
                            intent2.setData(data);
                            activityResultLauncher.launch(intent2);
                        }
                    } else if (strC != null && (tu2.W(strC, ".xapk", true) || tu2.W(strC, ".apks", true) || tu2.W(strC, ".apkm", true) || tu2.W(strC, ".zip", true))) {
                        Intent intent3 = new Intent(getApplicationContext(), (Class<?>) InstallerActivity.class);
                        intent3.setData(data);
                        activityResultLauncher.launch(intent3);
                    } else if (tu2.d0(string, "https://dw.uptodown.com/dwn/", false)) {
                        ko1.u(LifecycleOwnerKt.getLifecycleScope(this), ee0.a, null, new tm1(this, string, objArr5 == true ? 1 : 0, i6), 2);
                    } else if (mu2.i0(string, "preregister-available", false)) {
                        String queryParameter = data.getQueryParameter("appID");
                        if (queryParameter != null && queryParameter.length() != 0) {
                            try {
                                String queryParameter2 = data.getQueryParameter("appID");
                                queryParameter2.getClass();
                                m0(Long.parseLong(queryParameter2));
                            } catch (NumberFormatException e) {
                                e.printStackTrace();
                            }
                        }
                    } else if (!i93.m(this)) {
                        Locale locale = ky.a;
                        ko1.u(LifecycleOwnerKt.getLifecycleScope(this), ee0.a, null, new tm1(this, ky.i(data), objArr4 == true ? 1 : 0, i5), 2);
                    }
                }
                Intent intent4 = getIntent();
                String string2 = (intent4 == null || (extras3 = intent4.getExtras()) == null) ? null : extras3.getString("action");
                if (string2 != null) {
                    int i7 = MyFirebaseMessagingService.v;
                    if (string2.equalsIgnoreCase("notificationApp")) {
                        Intent intent5 = getIntent();
                        String string3 = (intent5 == null || (extras2 = intent5.getExtras()) == null) ? null : extras2.getString("appId");
                        if (string3 != null) {
                            sb2 sb2Var = new sb2();
                            sb2Var.a = -1L;
                            try {
                                sb2Var.a = Long.parseLong(string3);
                            } catch (NumberFormatException e2) {
                                e2.printStackTrace();
                            }
                            if (sb2Var.a > 0) {
                                Bundle extras4 = getIntent().getExtras();
                                String string4 = extras4 != null ? extras4.getString("packageName") : null;
                                long j = sb2Var.a;
                                long jCurrentTimeMillis = System.currentTimeMillis();
                                nd0.W(j, this, "fcm_app_id");
                                nd0.X(this, "fcm_packagename", string4);
                                nd0.U(this, -1, "fcm_download_id");
                                nd0.W(jCurrentTimeMillis, this, "fcm_received_timestamp");
                                nd0.W(0L, this, "fcm_shown_timestamp");
                                LifecycleCoroutineScope lifecycleScope3 = LifecycleOwnerKt.getLifecycleScope(this);
                                ge0 ge0Var3 = dh0.a;
                                ko1.u(lifecycleScope3, dn1.a, null, new fb((Object) this, (Object) sb2Var, (w20) (objArr3 == true ? 1 : 0), 27), 2);
                            }
                        }
                    } else if (string2.equalsIgnoreCase("campaign")) {
                        Intent intent6 = getIntent();
                        String string5 = (intent6 == null || (extras = intent6.getExtras()) == null) ? null : extras.getString("campaign");
                        if (string5 != null && string5.equalsIgnoreCase("BlackFriday")) {
                            A0();
                        }
                    }
                } else {
                    rw1 rw1VarD = u53.D(this);
                    if (rw1VarD != null && rw1VarD.e <= 0) {
                        LifecycleCoroutineScope lifecycleScope4 = LifecycleOwnerKt.getLifecycleScope(this);
                        ge0 ge0Var4 = dh0.a;
                        ko1.u(lifecycleScope4, dn1.a, null, new fb((Object) this, (Object) rw1VarD, (w20) (objArr2 == true ? 1 : 0), 25), 2);
                    }
                }
            }
        }
        getOnBackPressedDispatcher().addCallback(this, this.K0);
        int i8 = 6;
        this.R = registerForActivityResult(new ActivityResultContracts.StartActivityForResult(), new gm1(i8, this));
        ViewPager2 viewPager3 = (ViewPager2) findViewById(R.id.view_pager);
        this.o0 = viewPager3;
        if (viewPager3 != null) {
            viewPager3.setOffscreenPageLimit(4);
        }
        ViewPager2 viewPager4 = this.o0;
        if (viewPager4 != null) {
            viewPager4.setUserInputEnabled(false);
        }
        this.s0 = (TabLayout) findViewById(R.id.tabs);
        this.q0 = (RelativeLayout) findViewById(R.id.rl_app_detail_open);
        ImageView imageView = (ImageView) findViewById(R.id.iv_avatar_user);
        this.C0 = imageView;
        if (imageView != null) {
            imageView.setOnClickListener(new im1(i8, this));
        }
        ImageView imageView2 = this.C0;
        if (imageView2 != null) {
            ViewParent parent = imageView2.getParent();
            View view = parent instanceof View ? (View) parent : null;
            if (view != null) {
                view.post(new gw0(i, imageView2, this));
            }
        }
        this.D0 = (ImageView) findViewById(R.id.iv_badge_user);
        zm1 zm1Var = new zm1(this, getSupportFragmentManager(), getLifecycle());
        ViewPager2 viewPager5 = this.o0;
        if (viewPager5 != null) {
            viewPager5.setAdapter(zm1Var);
        }
        if (UptodownApp.h0) {
            ViewPager2 viewPager6 = this.o0;
            if (viewPager6 != null) {
                viewPager6.setCurrentItem(M0, false);
            }
            UptodownApp.h0 = false;
            if (M0 == 3) {
                AppBarLayout appBarLayout = this.f0;
                appBarLayout.getClass();
                appBarLayout.setVisibility(0);
                AppBarLayout appBarLayout2 = this.f0;
                appBarLayout2.getClass();
                appBarLayout2.setExpanded(false, false);
            }
        }
        TabLayout tabLayout = this.s0;
        if (tabLayout == null || (viewPager2 = this.o0) == null) {
            return;
        }
        new TabLayoutMediator(tabLayout, viewPager2, new gm1(i2, this)).attach();
        TabLayout tabLayout2 = this.s0;
        tabLayout2.getClass();
        tabLayout2.addOnTabSelectedListener((TabLayout.OnTabSelectedListener) new ym1(this));
    }
