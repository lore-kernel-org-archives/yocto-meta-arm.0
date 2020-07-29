Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.2919.1596017517406913036
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 29 Jul 2020 03:11:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=SHm0oiqj;
 spf=pass (domain: burtonini.com, ip: 209.85.221.43, mailfrom: ross@burtonini.com)
Received: by mail-wr1-f43.google.com with SMTP id a5so11096486wrm.6
        for <meta-arm@lists.yoctoproject.org>; Wed, 29 Jul 2020 03:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=sYNLgvvT1aWj0itvb6XJdUhk2YLJW1pm7JmUhJ6wyRc=;
        b=SHm0oiqjbE8kvttMEojJv1xdKp9K6nLddk3e76TQGOFvYweN3t2DbDSNxWz+zfi6eo
         xIo0fq7kSsxqJB4HYgLQy41yUwfv1i9YgVHtt/C9/ga7HRiUC69me3xyGjy/TlRscMUO
         LxTH8NmeOP3NrSiFsUQ+Mhyt3SUv4WbmbGY5XNBUky+/3df/InxCLG/rwDI/Bob1h+fe
         1vuTDjwR3kKTDIjRWwIImM9eK5N5kuRS3+ix5TF2WsVy7PqpyRP1/ofZQduwGsrL0HAm
         NNWhDF6VSxpUL2o3di9y6bxHAuycWfphFKtxUyK6UcINZD2f4Tl5wEnAAkl0FXHD1mS6
         DX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sYNLgvvT1aWj0itvb6XJdUhk2YLJW1pm7JmUhJ6wyRc=;
        b=WJMY/0WnJjHZyn+C0eQTRfFiPSMMVZREG3pG+HJmeDlpVNXpOYvSZBTfPqmq+1QR7u
         atpTAmvTtVoW9mHqrjDVraQ7qn+oWFVB/oRJTcSCfGvWoY2GndDgXfqp298JqFLzDK+J
         2qkORXZiuBR+ev/iKIlf7R88JriYAOcx5cAmgpn176efiKXfZ70zNhQFcvJa00MNB9OK
         TKDREhZz7bp2SCDUxiEGvi/XOn2WN1Pmp/AShqMm4i3ndtQvqQtoyO4A3qMsF/6K/YvW
         leR49F4004qFjwILmPftTdeDhozNoj5B3aW3AvsJCDMJG0XLzuzU2XIx1s8pSRdak+EB
         skQg==
X-Gm-Message-State: AOAM531XEnsBtXnU9i6dd2zIOBiLavHCeVave2lPy8vEITZQXjFQzGgh
	o81ReiD0Ysh5MRJHaf7lHBUHEVjXJXB38DJr
X-Google-Smtp-Source: ABdhPJw9p4WfLbtaPlqGH7GRLBLDEYeu5kB9abeXepdXUytc1FeqexI/A0DTU77P0eVrH2gFFeZnRg==
X-Received: by 2002:a5d:5446:: with SMTP id w6mr13373239wrv.127.1596017515709;
        Wed, 29 Jul 2020 03:11:55 -0700 (PDT)
Return-Path: <ross@burtonini.com>
Received: from rossb-vm.manchester.arm.com ([213.86.15.71])
        by smtp.gmail.com with ESMTPSA id h11sm4648780wrb.68.2020.07.29.03.11.54
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2020 03:11:55 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: meta-arm@lists.yoctoproject.org
Subject: [PATCH 7/9] arm/scp-firmware: move to 2.6.0 release tag
Date: Wed, 29 Jul 2020 11:11:43 +0100
Message-Id: <20200729101145.1794231-7-ross@burtonini.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200729101145.1794231-1-ross@burtonini.com>
References: <20200729101145.1794231-1-ross@burtonini.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ross Burton <ross.burton@arm.com>

Instead of an arbitrary commit, set the base recipe to build the 2.6.0
release.

Change-Id: Iec78c6ed903edfd020cca1222770d8ec018ae78a
Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../scp-firmware/{scp-firmware_git.bb => scp-firmware_2.6.0.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-arm/recipes-bsp/scp-firmware/{scp-firmware_git.bb => scp-firmware_2.6.0.bb} (97%)

diff --git a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
similarity index 97%
rename from meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
rename to meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
index a211621..ab7d9bd 100644
--- a/meta-arm/recipes-bsp/scp-firmware/scp-firmware_git.bb
+++ b/meta-arm/recipes-bsp/scp-firmware/scp-firmware_2.6.0.bb
@@ -6,7 +6,7 @@ LICENSE = "BSD-3-Clause & Apache-2.0"
 LIC_FILES_CHKSUM = "file://license.md;beginline=5;md5=9db9e3d2fb8d9300a6c3d15101b19731"
 
 SRC_URI = "gitsm://github.com/ARM-software/SCP-firmware.git;protocol=https"
-SRCREV  = "fd7c83561a7d76c7681d5d017fb23aa3664c028c"
+SRCREV  = "db19910aca6d1032eb0329e5fbb70a92b997f6f2"
 
 PROVIDES += "virtual/control-processor-firmware"
 
-- 
2.26.2

