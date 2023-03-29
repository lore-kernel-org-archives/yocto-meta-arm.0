Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78BB9C6FD18
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 12:01:05 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.22598.1680091264297591909
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Mar 2023 05:01:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pZfs7an4;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id u11-20020a05600c19cb00b003edcc414997so9433095wmq.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 05:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680091262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zqTlz5RogNhulBG/NAvpVBc2kWuMgXrAfmlt7XA6E14=;
        b=pZfs7an4Wvy+RA5+TgbVNSVCMAupD7KOnDNoroWh63cASutRduSX7kPk18Bw9UGEB+
         eiPfl7D11mQoxn8HBXDWpCZ44cViIw5vc9ykaXcmOHo7xG7/6TXoxedFQOT73oBO+9LW
         o3II62SNX6o4upq8ThFAtMBCz6vWGTDb1J1y1yay+0k5hIKJTQ4+q1xVmW4n6gkiEekN
         soA6Jfwy/q+KRrKlCEvvCjXAlnRz7d8KKhgfeonzvs6pPTyzWdOdrvXSTIanz8AWNLP0
         +rk1y5oib86uyNw5bn0iI4XIGm9uYcmzmS5m/F/wpgBhPaj7aRXG6rVDhvNEA4vlG1iV
         ia/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680091262;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zqTlz5RogNhulBG/NAvpVBc2kWuMgXrAfmlt7XA6E14=;
        b=qbDutsz5vDA9viM95e8kPLl2UmGDuOFfVGcwT4chJa11IY2hf+6VZA8b6+1m3SDAgE
         vvoM8RQdlHvzekOoEDsfBXK5E9QaGpDKzIYW3+oO21cV0FW/9L9WUPtTZWMcSlU3IOyY
         SB9jdukF70ww5kGRo8ezzpEH3jp2qlmLUFIXxCGTPDZm2LbU8beJQSvRhsjFhoVb4AHy
         mjJ9RRHYTncgVnVazwMA4Hs10/BSkYb5ljxD73iPBcV9PINTlQjcEK8qT2vyawAu1/Z8
         jYPyAPjY6DlPJTLOGucATNg/b/Z0ryjO/2/kaZkvxZXHpI8K9xq6Ln4tb+nBnZcQD9UK
         qNHA==
X-Gm-Message-State: AAQBX9efrt+X8DA6dOPFjAeAkNgWRdLdjNGyI4IgtihNS9A/3H6khuUN
	r229nxCcQ4VgzJpLHJDkQ6kREc4Uq6A=
X-Google-Smtp-Source: AKy350aEvu050MR6QxcdduD9IL6WBqum+mCuIOKxQgaRIcmi1y6Ft2fK5Wub1u5eUNd7NYhqxCV62A==
X-Received: by 2002:a1c:4c11:0:b0:3ef:6ea4:a675 with SMTP id z17-20020a1c4c11000000b003ef6ea4a675mr8641533wmf.36.1680091262060;
        Wed, 29 Mar 2023 05:01:02 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id f11-20020a7bc8cb000000b003eb966d39desm2080491wml.2.2023.03.29.05.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Mar 2023 05:01:01 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH 1/2] arm/lib: pass the PATH to fvp runner
Date: Wed, 29 Mar 2023 14:00:56 +0200
Message-Id: <20230329120057.58949-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 29 Mar 2023 12:01:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4495

When running an FVP machine the model executable need to be found
in the PATH environement.

At the moment the script doesn't provide any PATH to the subprocess.

Add PATH to the allowed environement variable to be forwaded.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-arm/lib/fvp/runner.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-arm/lib/fvp/runner.py b/meta-arm/lib/fvp/runner.py
index 28351a39..40ad1f3c 100644
--- a/meta-arm/lib/fvp/runner.py
+++ b/meta-arm/lib/fvp/runner.py
@@ -63,7 +63,7 @@ class FVPRunner:
         # Pass through environment variables needed for GUI applications, such
         # as xterm, to work.
         env = config['env']
-        for name in ('DISPLAY', 'WAYLAND_DISPLAY'):
+        for name in ('DISPLAY', 'PATH', 'WAYLAND_DISPLAY'):
             if name in os.environ:
                 env[name] = os.environ[name]
 
-- 
2.34.1


