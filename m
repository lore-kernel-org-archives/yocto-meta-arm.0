Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0A295C369AF
	for <webhook@archiver.kernel.org>; Wed, 25 Sep 2024 09:02:56 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web10.10992.1727254969975311040
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 25 Sep 2024 02:02:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=EHsuOeUB;
 spf=pass (domain: linaro.org, ip: 209.85.208.175, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2f7502f09fdso6470011fa.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 02:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1727254968; x=1727859768; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jwuoVlJXBCBaiOZc2xST+DF7Qpw/Hqk37Qz6P7FQQus=;
        b=EHsuOeUB/TIQ7PhhNuXunTXJdFewzamCdqKIZ3eP0eYDs4FA7EUqiQH0RSzgEDCa/L
         SlQxlPtLDJMLWt9rhEo7jmlgCvMQUfL2WsyS7eFcOsAcdwLHwAW5AjE3+gZx9ibNrOW2
         ZNeuIC5dkW5AxTVf5eI+cbtYRcM2F5tIMgxmbm17DVzED5L2tLVLAiUMJhtCMqHB55CJ
         youBe/w4fNpFdFCq9Engwvd9w1geE10YvwtXs6OA7UyCyMR47txo48fRa1I/vSvCBfQy
         59OzhjnU0vXHcL95v8ZW2eyleF81BFIH3daxes//nJBaomHAPcR+L3/DZe5DjVmRyexa
         6f7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727254968; x=1727859768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jwuoVlJXBCBaiOZc2xST+DF7Qpw/Hqk37Qz6P7FQQus=;
        b=Ad+kSKGNQKJ60fmaA0YtDrJ6c9yhxNA91Wu3L32dBmAhKSB9z25q7KIncCIVzulHfu
         XHnOm6KvPG9tVckBx/zafQMLRmOxGe882XZ+joMIaRlVgCMFF6wdE+0rLIcba9X+2krQ
         AwGqsJ2vyqfybt3B/JjKcx0proR1ZeV2PhMo/qxHjIwD+o4Ju0vH3fYwyrzUHhZE3BrW
         LOCoXNF4c62gitxjHZ4lPoFzrxxZxRF6ObAZRCx4iuIUyntG2r+V3B61u2AXlxhnLEsd
         eemyhu6quMbzB6ocmHR6ZZylWqKY7vIee5d0vHJtDPqLxY71sm7Y+e6qxylviEpsmQ0P
         2naQ==
X-Gm-Message-State: AOJu0YxGWw/6vB+qcvgsuq5Q+FyQCgT8cQdYFEKtAj5nqLg7urX4rGGv
	t1TjQjqY0zrqWIn73jEDCa0jhYUfszvSv23vU8OHvNIH4MYyE28HF5GHwg9zO7w/1LqrLabcilN
	+Kwk=
X-Google-Smtp-Source: AGHT+IFIk+ZvaIGp8gJXksuTCU84EJPb03FuPjlYZlELLRZZXd2EZ9cpz2B0T8lhV8X4Fhn8sF6l9Q==
X-Received: by 2002:a2e:bc84:0:b0:2f7:6664:f272 with SMTP id 38308e7fff4ca-2f8d0b67935mr24073321fa.6.1727254968040;
        Wed, 25 Sep 2024 02:02:48 -0700 (PDT)
Received: from localhost.localdomain (78-27-76-97.bb.dnainternet.fi. [78.27.76.97])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2f8d289ef7fsm4686501fa.119.2024.09.25.02.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 02:02:46 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH 3/4] optee-client: fix systemd service dependencies
Date: Wed, 25 Sep 2024 12:01:46 +0300
Message-ID: <20240925090147.66618-4-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240925090147.66618-1-mikko.rapeli@linaro.org>
References: <20240925090147.66618-1-mikko.rapeli@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 25 Sep 2024 09:02:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6105

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
 .../optee/optee-client/tee-supplicant@.service         | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service b/meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
index 72c0b9aa..8325b6be 100644
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
2.34.1


