Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 978ADCDE020
	for <webhook@archiver.kernel.org>; Thu, 26 Sep 2024 15:47:47 +0000 (UTC)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
 by mx.groups.io with SMTP id smtpd.web10.47057.1727365662693897940
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 26 Sep 2024 08:47:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=E4zUCMqj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.170, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-7a9ad15d11bso98919785a.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 08:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1727365661; x=1727970461; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bh/CuR4Fkv0PaoFzGTuwWg2KLGcL0m1HnCEVLGi12bI=;
        b=E4zUCMqjJ8teCjTMHbkSzWSAQpwh+PjTImzuO7hjzkMO4FDKF/gK873h8ODUM5+UNA
         13ByOQqtNm3yYeyZB36N6CAxOReykIsulAJMvz04oAoZD1ROltr8P2Ad0UjzTDuPXQV5
         kby1BZV2ds6xcRD35ZsveUPtTf8azLo0vKN+wzlxudM12s14Kn/g2Sq/FgnfOM0mqUBd
         c6pgRFOJET9kgvqLjSJLXKlTjx174a71bMJnEZ+HYNUxER5aR9jEvmjWfLAH+5zj+wkZ
         CTH9toutNHfblzpnn2kubECqSK+GJm9etwqTHR9uuAFB1Fw/OKBc/1bKEezyDSDQSeaA
         4HCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727365661; x=1727970461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bh/CuR4Fkv0PaoFzGTuwWg2KLGcL0m1HnCEVLGi12bI=;
        b=TGms29yn8rzPSM+lfODW75z8WUlN/7500/9IxbTxqGcZ6S45fS+iMuzFpa37u0MFB8
         GpiZsGcEgxPONuSyosTuHznPhnaaYCQhwcBK7bqzmCx751MkghlLbtuQETGZ8MPVetAD
         yYOpuKKj6pIKcjBn9486Qss5BnQEWz7fwIvnC6+EwKIojICXYSAZB3T8uJOM3eZnVQLJ
         /kvQplbtyuyqIfTPZiloU6YMkUCw/HUU2dijQuXnKmGYM1RMjYSZfr+4lckC/rkn3bqu
         k874P2qENx0uvJldGUN4W+hkTeP1WmbSv+xeM2citasmJpdB/lp6t/jVeBsYtnNeU5N0
         E7fw==
X-Gm-Message-State: AOJu0YzcowgFoOth+ssn60t4VZKJx8CHT0HPshSbBc66aeFRGGlzh0v0
	AND50ORqDcixkXwpruLI//lwi1B8hOoQSR2JC8ZDGnb8UQuWbPUd4chWKaDDQL8mkudDl1Nj4WI
	=
X-Google-Smtp-Source: AGHT+IExluvtqxW7yTuK1rk1pwlgcAdadrn3kiOLugpu67R9ytUQ1Y3AOnuKmG19Ci6uM1Omav/d5A==
X-Received: by 2002:a05:6214:5712:b0:6cb:378c:b32a with SMTP id 6a1803df08f44-6cb3b63ee8amr1974016d6.46.1727365661454;
        Thu, 26 Sep 2024 08:47:41 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb3b66b507sm396976d6.99.2024.09.26.08.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Sep 2024 08:47:41 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v7 2/4] arm/optee-client: fix systemd service dependencies
Date: Thu, 26 Sep 2024 11:47:37 -0400
Message-Id: <20240926154739.2379609-3-jon.mason@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20240926154739.2379609-1-jon.mason@arm.com>
References: <20240926154739.2379609-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 26 Sep 2024 15:47:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6119

From: Mikko Rapeli <mikko.rapeli@linaro.org>

udev starts tee-supplicant once optee has been found.
Fix dependencies in systemd service so that starting it in
initrd is possible. Stopping requires that ftpm
kernel module is disabled or any TPM related actions will fail until
the next reboot so working around these in the service file. These
are limitations of current kernel optee and ftpm drivers.

tpm2.target requires systemd 256 or newer. With older system version
there is no simple way to queue in service before TPM device is
available.

https://www.freedesktop.org/software/systemd/man/devel/systemd.special.html#tpm2.target

Note that
https://www.freedesktop.org/software/systemd/man/devel/systemd-tpm2-generator.html
detects TPM support from either existing kernel driver (built in or
loaded really early in initrd and rootfs boot) or ACPI table entry for
TPM device. If firmware used a TPM device but doesn't provide ACPI table
entry for it, then a kernel patch has been proposed to expose this to
userspace:

https://lore.kernel.org/lkml/20240422112711.362779-1-mikko.rapeli@linaro.org/

and matching change proposal for systemd:

https://github.com/systemd/systemd/pull/32400

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
Signed-off-by: Jon Mason <jon.mason@arm.com>
---
 .../optee/optee-client/tee-supplicant@.service         | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service b/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
index 72c0b9aa57ec..8325b6be5174 100644
--- a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
+++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
@@ -1,10 +1,12 @@
 [Unit]
 Description=TEE Supplicant on %i
+DefaultDependencies=no
+After=dev-%i.device
+Wants=dev-%i.device
+Conflicts=shutdown.target
+Before=tpm2.target sysinit.target shutdown.target
 
 [Service]
-User=root
 EnvironmentFile=-@sysconfdir@/default/tee-supplicant
 ExecStart=@sbindir@/tee-supplicant $OPTARGS
-
-[Install]
-WantedBy=basic.target
+ExecStop=-/bin/sh -c "/sbin/modprobe -v -r tpm_ftpm_tee ; /bin/kill $MAINPID"
-- 
2.39.5


