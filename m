Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DA46C369C4
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 10:04:36 +0000 (UTC)
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
 by mx.groups.io with SMTP id smtpd.web10.12209.1727258674856741104
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 03:04:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=Ha9XPGWj;
 spf=pass (domain: linaro.org, ip: 209.85.167.49, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53568ffc525so7701709e87.0
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 03:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727258673; x=1727863473; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2Tgk0JEhZRg//lLIz4/TGocfEx6DjU5t57PgwJMeQA=;
        b=Ha9XPGWjrgTPgs58PsWajgFE+KU0+eBSTI3Moyf5qWEUusHK4k0xgtgKXeFAwn/eJ9
         CZTVuGDEj3s/YwfAPDlJF3mPw60LwkHudUoe4dqMNNZGPRD9U3iKw3JqbTTJUokqNYv5
         3kIr7J598961feIfIYYVK0gWBnV6S+/bbVAM8b9SiQqKw4dgaIUuJ3YlR6yELGkHCPZq
         7/TUlAZjKgfbPofGogbrbND2XklbqMUgrzTb7phKLDFNxBuBCet+/qbkSVX82uTFuAwP
         HQjUhQbiky6Kq3OijSFToRfTkFIjsciB74JmRVJsysHnJ6kCGJNZ1kHtgu7PDQctcGmU
         EVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727258673; x=1727863473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G2Tgk0JEhZRg//lLIz4/TGocfEx6DjU5t57PgwJMeQA=;
        b=Syz1YqGOveaJk7STk+CQUNRwQ6Vrs5eqA5EM6iGw6/kYdo9PkxogLU5KHv9UZfJnpz
         hPT0TGqDcXvrZcWr2PV+W5x2EYAf+iZZ9Lr9OlC8CMAxUm1aBj4KKT8uSTd4Q2F0szxa
         IuuzHVZiqfQbs6NHq//8W1p4kV6hceLqUZmyWNUj7AbYF+/UYiWePsR/E7kyPZMdTuqP
         OaD+R0jQ+5d25e2W38wAPwz9IKEI2rDtOT8UhJa72aaDfaXJkf+TyhTmMLX7PBMz1qD6
         qMsT38U2mzCWSRhnXEq5gy8iUf4SyZxuQFP5haI/9sI66SUtu3hTHPvKB670g/3abrxm
         Z4GA==
X-Gm-Message-State: AOJu0YysSH82xk/4pu+WqtCqgNOE/gqvKBOGj8hhwT97w9ZnZ3dmMpTd
	Kptn0HRUzYZwNAPNt26lNslRRPponQmyi5AGVF39y0LuzYD1x4vsc7AYEmnaxGvxyWlugPubpYA
	0A50=
X-Google-Smtp-Source: AGHT+IGNMSP5RybybEuft6fFwLYiGb/G+Ja2ZIYsbGNxFxIC2HOiF5VsBNM9BuNOS0QcVyKNcF1C0w==
X-Received: by 2002:ac2:4e14:0:b0:536:53e3:fe9d with SMTP id 2adb3069b0e04-5387049840amr1242311e87.18.1727258672888;
        Wed, 25 Sep 2024 03:04:32 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a864d9d9sm478631e87.253.2024.09.25.03.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 03:04:32 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH v2 3/4] optee-client: fix systemd service dependencies
Date: Wed, 25 Sep 2024 13:04:13 +0300
Message-ID: <20240925100414.73073-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925100414.73073-1-mikko.rapeli@linaro.org>
References: <20240925100414.73073-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 10:04:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6111

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
---
 .../optee/optee-client/tee-supplicant@.service        | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service b/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
index 72c0b9aa..e3039fde 100644
--- a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
+++ b/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
@@ -1,10 +1,13 @@
 [Unit]
 Description=TEE Supplicant on %i
+DefaultDependencies=no
+After=dev-%i.device
+Wants=dev-%i.device
+Conflicts=shutdown.target
+Before=tpm2.target sysinit.target shutdown.target
 
 [Service]
-User=root
+Type=notify
 EnvironmentFile=-@sysconfdir@/default/tee-supplicant
 ExecStart=@sbindir@/tee-supplicant $OPTARGS
-
-[Install]
-WantedBy=basic.target
+ExecStop=-/bin/sh -c "/sbin/modprobe -v -r tpm_ftpm_tee ; /bin/kill $MAINPID"
-- 
2.34.1


