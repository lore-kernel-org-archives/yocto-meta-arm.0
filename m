Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0722AC54791
	for <webhook@archiver.kernel.org>; Wed, 13 Mar 2024 13:38:02 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web10.17009.1710337076580708485
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Mar 2024 06:37:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=J9X182BL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7884a9a47a5so212582885a.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 06:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710337075; x=1710941875; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xomTBzf4TOqj6dxLKkY3EyzdresKt+ZZ3RaLSB5+wQQ=;
        b=J9X182BLvQ6KGrSsOyDL5nZ7vob7ZoADQyfSTo4K7UQeg0qClT0XGkozm3yy7KeGVa
         RWll3Z/iOLgPWXdEkAhol93YHutEksD2HRm8guoYQnXo/6NBuyZqq0eavTU68utK4GEm
         uO2cCTpR4gy2WnCw+rqbIOVvRrZcqMnOx8HjM1jNgz05eqJcmZ6ZVD/WD2hNtE+jGo0J
         ROKrGkBfE+8Q+nrt6dqwPY3NxfdCyP8Ma+8yD5O2Q5X3ozGug7EktltV/oCUnOa/qYEG
         aMWH2Qed2XHB4RA5ErqYWWLzN007fI1OZaICMJKNvzugY6xM4ssSjKAM36N552i6Bc01
         0Eog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710337075; x=1710941875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xomTBzf4TOqj6dxLKkY3EyzdresKt+ZZ3RaLSB5+wQQ=;
        b=N/Cfbs5jP93S8XriOrDYMpmihb/zaHyHCx1jMAFs8CdtVkNX88Uxod7UbH8LucnFew
         9UCiaXiPgfl6P0SfLR0zCJLsaIJfJHKv92yObXH2djM+oT1Z28o51Jfi5mbLKlezvVKu
         4cv3xH7hJEOIKpLDcae9+2tWamMnhIMAecNcBaPmlVmjgs8rSxchH4il4B3z+081cOvM
         kM5A6ql/ZY4/MntLX8HjK35/czToSIBa0NuTloBqdVnQ2xdcoWrdrAM5vwBc6b6ApwPR
         PkpDxaVbjlfcOupBh3ari3rZrvwQbzJiM1rUAstv7WeHN83JYMl9CKGxM5JChjh3Lm2n
         75rA==
X-Gm-Message-State: AOJu0Yx3f887OGt0Im9GdIOgf9mgwIL+HENs310RNarJPKQaRYWYLVoa
	P5D4mkGaI7CpcRIWq/e6+mbs92PHU6xs/5fycftcqclhZbRAtG9dPagXImPFfTIOU8035NjB02a
	GJw==
X-Google-Smtp-Source: AGHT+IGTLDDUnWXv+jwFexsMnE+WF85R8tmru3wDt1zTfg0TEdDGwjEUyTX56xzzo9SyFfCwcyVaSQ==
X-Received: by 2002:ae9:e643:0:b0:788:5e6e:876f with SMTP id x3-20020ae9e643000000b007885e6e876fmr12399100qkl.40.1710337075584;
        Wed, 13 Mar 2024 06:37:55 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id w8-20020a05620a094800b007884dd207b8sm4688496qkw.55.2024.03.13.06.37.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 06:37:55 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: Khem Raj <raj.khem@gmail.com>,
	Peter Marko <peter.marko@siemens.com>
Subject: Re: [PATCH v2] optee-ftpm: fix EARLY_TA_PATHS passed to optee-os
Date: Wed, 13 Mar 2024 09:37:10 -0400
Message-Id: <171033703271.1772326.7484894705061711684.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240229071922.76043-1-alexander.sverdlin@siemens.com>
References: <20240229071922.76043-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 13 Mar 2024 13:38:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5426


On Thu, 29 Feb 2024 08:19:16 +0100, A. Sverdlin wrote:
> Fix the build with DISTRO_FEATURES containing "usrmerge":
> make: *** No rule to make target '/.../optee-os/4.1.0/recipe-sysroot/lib/optee_armtz/bc50d971-d4c9-42c4-82cb-343fb7f37896.stripped.elf', needed by '/.../optee-os/4.1.0/build/core/early_ta_bc50d971-d4c9-42c4-82cb-343fb7f37896.c'.  Stop.
> 
> 

Applied, thanks!

[1/1] optee-ftpm: fix EARLY_TA_PATHS passed to optee-os
      commit: a01f272149379085845e798dc46d31f680d7431d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

