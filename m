Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCAABC021AA
	for <webhook@archiver.kernel.org>; Fri, 21 Feb 2025 12:24:03 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.21715.1740140634263488170
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 21 Feb 2025 04:23:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KEP8d+TY;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: quaresma.jose@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38f2b7ce319so1696490f8f.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 21 Feb 2025 04:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740140632; x=1740745432; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PUxMCigryO6kRP+0YmqfGae9RXCdt/2CgCUGx3F6h+o=;
        b=KEP8d+TYqN0/7IHVeSRw0xJU8pTRvqYNuROKRUsEprdEp/UmQap90cVoojumpYwnBz
         0h7lonjO4r05z7GxB+bBEqmIkM0286csYWYgUC6P0F82sSt8iQMBKM8LtCp7IO0b760v
         D7jzuR3+XxIFwZVwzC7VDD0Bt3JPJbjBBR8m/abFHwG7aiWZndSjWizMj0X9l+T6feJ/
         EXPx5n1vdxz/46CvCr1bll4MhHmLZQ6x3YB3New/eyx7PsphzY0YNIiq2jYUcbhPipFN
         eiVPKLWBC6OxogiyXadwjN7huBPMkfMlYGxWH6ePesBd9tzWK0C9xZmPtUiVQ/0fOP5n
         pBpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740140632; x=1740745432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PUxMCigryO6kRP+0YmqfGae9RXCdt/2CgCUGx3F6h+o=;
        b=SS8CQCkMlZY+4jIlfbbg12FGx1LY5SE66kszUmM4W14Zx8swQ42e3aRMiTfehAu66S
         CJ2M/AJ5ClSTY1Q0GmJ2zTGWxYo2H1zSADL/NzSjUeVnL23khjN69RR4bdieLxOvp22N
         PRKMkNGpMFRLKAPE2liiVMlGt5wQjmCScxUVn69hfobX2NeUu3uKz9v1UyGI7UVKknCZ
         gLAtLqUrV9g9q+nJdJwDbStQ35ZvRqtPrPXaC00WutALE2x09n8divIJSCAD9/tFOmb0
         4PPvznBPtzc9Ld9jV12eSIjPXaBi+qIypJZqXCbZnbkMEN79e37xyo95+zZSKy0jqIKR
         pjzg==
X-Gm-Message-State: AOJu0Yz5TL+iAlqcRYpN1dO51PJmVOJQyLedYjFvzyw0rpe+Cub8VMFd
	vGDLS9iZuxJ+ItBRLikom9ehkpyv2D/73nCaPfUITdCvji1MFl5eq2/cG4SX
X-Gm-Gg: ASbGncshPKhmHF6OOU4cQT9tzXjAbDzwnuS6Ivfd6HZaevHiTmdSZrYmWnULJ9UqwdP
	60cwnlv/d3c4tBXCEdebcysDhCsNkr4Ll472CcJ7UK2+AMQrX6pp1pnd3jdymgP6kjoKQ57oey5
	NAVz2ZtxSsD1esStuxCZPCSP4RPIRUbpwijJlSEaIufqaR92wTh1HBLw38pJEwpqng6kS4OAZe4
	1xfhvtp5nC+bQb2zEpUSJI6Y6CjwRlzz0uZ1gXsvSpvyZ4Xjd0ETrc5sFgcwNV/xZtu1kffqf1U
	NKCb0AEySEEhphW/kp3W/B5/sUkxbLupze8=
X-Google-Smtp-Source: AGHT+IGLOoUpv16NTB2B4dgul4fiH2OE+7sfG7cYZZnznr7Rt3F5Aa2cBNtVswsoCPlZICQtwmZtWw==
X-Received: by 2002:a5d:6daa:0:b0:38a:87cc:fb42 with SMTP id ffacd0b85a97d-38f6e95d5famr3012752f8f.21.1740140632222;
        Fri, 21 Feb 2025 04:23:52 -0800 (PST)
Received: from toster.lan ([185.228.162.131])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f771dsm23065430f8f.81.2025.02.21.04.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 04:23:51 -0800 (PST)
From: Jose Quaresma <quaresma.jose@gmail.com>
X-Google-Original-From: Jose Quaresma <jose.quaresma@foundries.io>
To: meta-arm@lists.yoctoproject.org
Cc: Jose Quaresma <jose.quaresma@foundries.io>
Subject: [PATCH][master][scarthgap] bsp: optee-client: cleanup old tee-supplicant
Date: Fri, 21 Feb 2025 12:23:03 +0000
Message-ID: <20250221122301.2009380-3-jose.quaresma@foundries.io>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 21 Feb 2025 12:24:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6377

The same tee-supplicant is available in the meta-arm layer
along with the recipe.

| meta-arm/recipes-security/optee/optee-client
| meta-arm/recipes-security/optee/optee-client/tee-supplicant.sh
| meta-arm/recipes-security/optee/optee-client/tee-supplicant@.service
| meta-arm/recipes-security/optee/optee-client.inc
| meta-arm/recipes-security/optee/optee-client_4.1.0.bb

Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
---
 .../optee/optee-client/tee-supplicant.sh      | 46 -------------------
 .../optee-client/tee-supplicant@.service      | 10 ----
 2 files changed, 56 deletions(-)
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.sh
 delete mode 100644 meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant@.service

diff --git a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.sh b/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.sh
deleted file mode 100644
index b4d21950..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant.sh
+++ /dev/null
@@ -1,46 +0,0 @@
-#!/bin/sh
-
-# Source function library
-. /etc/init.d/functions
-
-NAME=tee-supplicant
-PATH=/sbin:/bin:/usr/sbin:/usr/bin
-DESC="OP-TEE Supplicant"
-
-DAEMON=@sbindir@/$NAME
-
-test -f $DAEMON || exit 0
-
-test -f @sysconfdir@/default/$NAME && . @sysconfdir@/default/$NAME
-test -f @sysconfdir@/default/rcS && . @sysconfdir@/default/rcS
-
-SSD_OPTIONS="--oknodo --quiet --exec $DAEMON -- -d $OPTARGS"
-
-set -e
-
-case $1 in
-    start)
-	    echo -n "Starting $DESC: "
-	    start-stop-daemon --start $SSD_OPTIONS
-        echo "${DAEMON##*/}."
-        ;;
-    stop)
-	    echo -n "Stopping $DESC: "
-	    start-stop-daemon --stop $SSD_OPTIONS
-        echo "${DAEMON##*/}."
-        ;;
-    restart|force-reload)
-	    $0 stop
-	    sleep 1
-	    $0 start
-        ;;
-    status)
-        status ${DAEMON} || exit $?
-        ;;
-    *)
-        echo "Usage: $0 {start|stop|restart|force-reload|status}" >&2
-        exit 1
-        ;;
-esac
-
-exit 0
diff --git a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant@.service b/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant@.service
deleted file mode 100644
index 72c0b9aa..00000000
--- a/meta-arm-bsp/recipes-security/optee/optee-client/tee-supplicant@.service
+++ /dev/null
@@ -1,10 +0,0 @@
-[Unit]
-Description=TEE Supplicant on %i
-
-[Service]
-User=root
-EnvironmentFile=-@sysconfdir@/default/tee-supplicant
-ExecStart=@sbindir@/tee-supplicant $OPTARGS
-
-[Install]
-WantedBy=basic.target
-- 
2.48.1


