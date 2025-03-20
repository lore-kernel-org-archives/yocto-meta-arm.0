Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20268C28B30
	for <webhook@archiver.kernel.org>; Thu, 20 Mar 2025 14:11:59 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.8645.1742479910710326340
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 20 Mar 2025 07:11:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=dSBGQRYV;
 spf=pass (domain: linaro.org, ip: 209.85.167.45, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-54ac9b3ddf6so928502e87.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 20 Mar 2025 07:11:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742479909; x=1743084709; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mqwkufLkPMDZHbJnXm48FdD8gdrXhCvSlGS6MqciLPA=;
        b=dSBGQRYVwxhUJozhuNxNRVHvLWEVxGUH5Yi71MjmyL3PbwxB4IzhDmq0e+rfYEDsyP
         h6Ao8gq2CHglONZVirSU25ex0H2RIZK3GTnhwWINmu8jja9TdZlQKGfMDqnj/VjfcCMY
         Kjsd8Ge72naSZGk3ggVBYX4sOD643OjuaftjpJhF35PNJdBb83vfK+et5fwKwksvTYgH
         L/Z74RsXFX45xwReLTEkisixGtKEqR0aeYZ8hQsnlTmWDLCICWhxKBsh8/toBX5yWSMG
         7i86jUcfhJo4jSwewqlFXyyI1Pg1zQ7mzHwHtPwNqafIiay3xFlOUjpqau+XAVWYn45n
         E+xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742479909; x=1743084709;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mqwkufLkPMDZHbJnXm48FdD8gdrXhCvSlGS6MqciLPA=;
        b=kSMvoWBqTFPBCU6EYjg43w2VhBfcA7B9fnkHACv4Q0Hcwb4RObhHuBKLynLPym6bCe
         Q0ti4zNMiOWDQdenfOb415prrHaCACo4DHFss9wSRS7VxF6vsye+dGYKJtvL23SMisZA
         XLeaOQElxbr0yAqft+sO2HptW19ig/qO3QpgZlQ012P5OkmDp4xgdriox5Eg3vGbdbeK
         f8BIZRRNzp5/ZQRT6ZAAlK6/NLfAtR2fLLIfSsHIfKdJ/DxjQdROlxuN/oInlpLr5pC6
         x3hzU7AhOdv4BhMalI6HJrXxs2Ar3VI6P5cqResqac6i/kemxRK/cjjk3unnATx11GZT
         DUTw==
X-Gm-Message-State: AOJu0YxUF50rwemXkxJIB+NwJnGU78XtBePA5eNYpiT87mvHHyARvcWR
	guAUvENKvoVGbdx4SMJSyIYiX/lK2nkY+z5vv0K8DQKq3ah/UmveNYhmfKrSur2OW/gFuXp+gRt
	z9UI=
X-Gm-Gg: ASbGnct/UdN2lw6Z8EtdeohU11vUN02ToCqrbjkCycOqJaueeFU/iNYNJVLxmu+PNej
	NrNgsSBIEpjc+HIvo0jeaujziqgTnAAx7FObZfVaMOFdStp1agcMdJLCGa2q+5q1KsJ3K3TEelj
	VY50CD+5ywNRhLIXeNx1dxwV9T4jofgnTlstEDQ4OMLIgteQ2/9+LVwKs/IEbLMZd3hLTHbXiDk
	3XCuSuNfh4sYPcJ6C4ntwQYGR/wEDa812UTlGnpY2ZH6fqbOCRVpLWA1QzLOdpI7cdeofbRZU3o
	4OuiyYAkJndyos4cqXwSwveFjsQlfjx+849foLHlhWR+Z/tA1RZ/5VqpGpdguN6IMOQu9VNjdx7
	IemVgnXQoCyVQBJA6aPkkrYRDZiNCk3JZ
X-Google-Smtp-Source: AGHT+IGu728gECbFzfj7qJhT1xYjyfyxoxhi9XQZ5VbDCCTPercE3cADmSGyLAyCEPXnpcjl95hGSA==
X-Received: by 2002:a05:6512:3b98:b0:549:59d2:9ac0 with SMTP id 2adb3069b0e04-54acb21bc78mr2202721e87.47.1742479908726;
        Thu, 20 Mar 2025 07:11:48 -0700 (PDT)
Received: from localhost.localdomain (87-100-218-141.bb.dnainternet.fi. [87.100.218.141])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-549ba864d0esm2261464e87.154.2025.03.20.07.11.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Mar 2025 07:11:46 -0700 (PDT)
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: meta-arm@lists.yoctoproject.org
Cc: Mikko Rapeli <mikko.rapeli@linaro.org>
Subject: [PATCH] oeqa parselogs-ignores-sbsa-ref.txt: ignore screen error
Date: Thu, 20 Mar 2025 16:11:27 +0200
Message-ID: <20250320141127.588668-1-mikko.rapeli@linaro.org>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 20 Mar 2025 14:11:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6405

It's not clear why this happens but this error is visible
in CI builds too often. Root cause needs analysis but
ignore the error for now.

https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/1190/steps/23/logs/stdio

Traceback (most recent call last):
  File "/srv/pokybuild/yocto-worker/meta-arm/build/meta/lib/oeqa/core/decorator/__init__.py", line 35, in wrapped_f
    return func(*args, **kwargs)
           ^^^^^^^^^^^^^^^^^^^^^
  File "/srv/pokybuild/yocto-worker/meta-arm/build/meta/lib/oeqa/runtime/cases/parselogs.py", line 185, in test_parselogs
    self.assertEqual(errcount, 0, msg=self.msg)
AssertionError: 1 != 0 : Log: /srv/pokybuild/yocto-worker/meta-arm/build/build/tmp/work/sbsa_ref-poky-linux/core-image-sato/1.0/target_logs/Xorg.0.log
-----------------------
Central error: [   103.173] failed to find screen to remove
***********************
[   101.955] (**) QEMU QEMU USB Tablet: (accel) selected scheme none/0
[   101.955] (**) QEMU QEMU USB Tablet: (accel) acceleration factor: 2.000
[   101.958] (**) QEMU QEMU USB Tablet: (accel) acceleration threshold: 4
[   102.144] (II) event0  - QEMU QEMU USB Tablet: is tagged by udev as: Mouse
[   102.169] (II) event0  - QEMU QEMU USB Tablet: device is a pointer
[   102.228] (II) config/udev: Adding input device QEMU QEMU USB Keyboard (/dev/input/event1)
[   102.228] (**) QEMU QEMU USB Keyboard: Applying InputClass "libinput keyboard catchall"
[   102.229] (II) Using input driver 'libinput' for 'QEMU QEMU USB Keyboard'
[   102.229] (**) QEMU QEMU USB Keyboard: always reports core events
[   102.229] (**) Option "Device" "/dev/input/event1"
[   102.318] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: Keyboard
[   102.326] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
[   102.345] (II) event1  - QEMU QEMU USB Keyboard: device removed
[   102.385] (**) Option "config_info" "udev:/sys/devices/platform/PNP0D10:00/usb1/1-2/1-2:1.0/0003:0627:0001.0002/input/input1/event1"
[   102.386] (II) XINPUT: Adding extended input device "QEMU QEMU USB Keyboard" (type: KEYBOARD, id 7)
[   102.519] (II) event1  - QEMU QEMU USB Keyboard: is tagged by udev as: Keyboard
[   102.527] (II) event1  - QEMU QEMU USB Keyboard: device is a keyboard
[   103.105] (II) modeset(0): Disabling kernel dirty updates, not required.
[   103.165] (II) config/udev: removing GPU device /sys/devices/pci0000:00/0000:00:01.0/drm/card0 /dev/dri/card0
[   103.173] xf86: remove device 0 /sys/devices/pci0000:00/0000:00:01.0/drm/card0
[   103.173] failed to find screen to remove
***********************
1 errors found in logs.

Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
---
 .../lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref.txt      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref.txt b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref.txt
index dd477996..42d1bbee 100644
--- a/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref.txt
+++ b/meta-arm-bsp/lib/oeqa/runtime/cases/parselogs-ignores-sbsa-ref.txt
@@ -3,3 +3,6 @@ NUMA: Failed to initialise from firmware
 
 # TODO: we should be using bochsdrm over efifb?
 efifb: cannot reserve video memory at 0x80000000
+
+# TODO: debug why this sometimes happens
+failed to find screen to remove
-- 
2.34.1


