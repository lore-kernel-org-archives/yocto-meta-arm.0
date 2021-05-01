Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
 by mx.groups.io with SMTP id smtpd.web12.11322.1619897204388587158
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 01 May 2021 12:26:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20150623.gappssmtp.com header.s=20150623 header.b=exdPXxEl;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.46, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f46.google.com with SMTP id u7so719643qvv.12
        for <meta-arm@lists.yoctoproject.org>; Sat, 01 May 2021 12:26:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=WmPC4zM9qs4lV6CSHt9Q6Hc73et1YO9dX/tpK/nkI/s=;
        b=exdPXxElt3pk2hUUjBKmZ+gKra0/wXoc/P78ZjMao3Xrm11MJnWl1bR6aaTkNetpPS
         yXYq0AKh85Hcss86w+zO/h1EFN+p4ZAo0lKs+tHSJdDMCbLerieCCZGdqfktTXGy1HWu
         i1GSrTdXnz5oya4XCmjekytYqadmD9kd3qFygUzmIE92X0TX/dKNkv6QVCpb4geka3VL
         X8fflnPAxAF/ZYlv19bGpGSloihaRsLQEqLbSg5Nh+v8mmf7icVnV6AxZCA3L7H772eN
         p9Z/urieaPp+iJSyrayuY+1NTKsC7uPNdkNKpYigMRs6/9JNXkRKrH7RNpCLamXxD86X
         e3LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=WmPC4zM9qs4lV6CSHt9Q6Hc73et1YO9dX/tpK/nkI/s=;
        b=ml5Bja2egkyEr6Z3fwjT3zUqp7ZiuTAL2qAv1PgvlpDqZ36cSQ5QI0fcUCu4rygzW2
         ckjvepxr2fwtc2Hn4BM4OORy4ijwb1lAQlj6SkuVAZNdUcrx6fT44kjaFPUglwPYu4fb
         8JYOMIhLfP2eH2DU5fnhyPNhKh9i+NN/vwF4OYk3lEvcEpc6o4F68nYFcemuzbQ0e9ov
         +tBb9gpqZGPjiMtPsr1CxCW9RGw8Yrw5R4321AZWYCfPdMot7TNUogAH2g1xoTN6RYMz
         x8LUTFExdHrMh2gwcXjUMftdpMSENTR+FU3H60dT2nkbSyKKMBBOTi+FiweTNfFhk65x
         ueqA==
X-Gm-Message-State: AOAM531cEe2GJ/tfN39b0ycvyyoOdJWU7synNn3LLhyrxIu4hIQxWfTw
	GK+eT6Lv88WHyNFRzE1awmm2c/EeMzGhOQ==
X-Google-Smtp-Source: ABdhPJwh6AO4fZ2iCvy9picoThQmgIDMo5UbMe7qtIRA8CkKmUNvUElimLyzEwnADZj2P0/vnopzPA==
X-Received: by 2002:a0c:e601:: with SMTP id z1mr12004621qvm.62.1619897203420;
        Sat, 01 May 2021 12:26:43 -0700 (PDT)
Return-Path: <jdmason@kudzu.us>
Received: from kudzu.us ([2605:a601:a601:f800:1c11:4abb:70dd:58e6])
        by smtp.gmail.com with ESMTPSA id o10sm4969239qti.33.2021.05.01.12.26.43
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 May 2021 12:26:43 -0700 (PDT)
Date: Sat, 1 May 2021 15:26:41 -0400
From: "Jon Mason" <jdmason@kudzu.us>
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm hardknott release
Message-ID: <20210501192641.GA20675@kudzu.us>
MIME-Version: 1.0
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

meta-arm has released the hardknott support branch.  The branch was
forked on Friday, 32 April from the master branch and was tagged as
"3.3" yesterday.  The tag is GPG signed and my public key can be
provided if someone wants to use it to verify.  Per the previous public
discussion on this list, hardknott will only be taking bug fixes and be
passively maintained (with dunfell being the actively supported LTS).

Per an external request, we have duplicated all existing "numbers only"
tags (i.e., 3.3) with a "yocto-x.y.z" tag (i.e., yocto-3.3).

Thanks,
Jon
