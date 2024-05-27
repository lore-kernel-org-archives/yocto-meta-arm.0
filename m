Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 775ECC25B74
	for <webhook@archiver.kernel.org>; Mon, 27 May 2024 10:37:52 +0000 (UTC)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
 by mx.groups.io with SMTP id smtpd.web10.24667.1716806271296060620
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 27 May 2024 03:37:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LUD2+rau;
 spf=pass (domain: gmail.com, ip: 209.85.218.47, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a626776cc50so354002166b.3
        for <meta-arm@lists.yoctoproject.org>; Mon, 27 May 2024 03:37:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716806270; x=1717411070; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zh5Q+t7wuTiQYr9TvZyeEl9Tt1MNJv2ixFaa+XcTnFw=;
        b=LUD2+rauwq5rDO1wM3r/zQYs16H9QhZHhi3/P1HZ6M/2THP3XYe7bs17Zpjfv5GgKU
         nLY4gkaSUYaUmOKtT8XuX/N7HLvP6zS3XBf1db+8GlOT5ZjrU27XIcOaCVIZx7GJJWJf
         Ue7vQ9dnPSkKjohCEudYGo5xp60rp0VR2d97zCY2WXjHh5ud4Pue9AcvkaMZ5U8wI0bC
         YcpehF1BTbxyioGpBL9KyBtA55YLy52ApRah/htkE300v4kImtHbTQsKtLTmKOBkMkwF
         OAWfwYp7kjyG4MOspuWvxs+lrXGBECFPUMHqyi0z/k1JE3TxuDY7kUQoeQeA1ZEiM9tA
         zIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716806270; x=1717411070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zh5Q+t7wuTiQYr9TvZyeEl9Tt1MNJv2ixFaa+XcTnFw=;
        b=bSXZxkGEv1h5RCYdipCCHdfjy4qGQR7eGkKGCAACZpE5M6OBuJ6HhoPbFa8GWzacJf
         qwqaks7kT2g+Q4q2LAYm1OvGuWiyMIy3tte+7HRJ97/yGDVoucjYRwDigFUnfViOCdi6
         OIC7OmgDKN2SBWjQiC3lAt591shjTUc7EJGkGCUglmna/V6bDl9BkXqOxrzAECtO+/lZ
         uk1Z9HuuE2cki8F4Qvl+suePPA3TSZu2oQcpyyxySq1HvBBA8s2PVNgfq+zwdzyjj0RC
         CmlpwMWOZRD69ymmE7auCYLmLUVJbxr4uqnAP+D8+0jLrOw7g/gotm0AwXtmPorgQj3I
         9DKA==
X-Gm-Message-State: AOJu0Ywp0VmBiixRiCmyrDfPAV03EcJfH0Mv5IxtbLEambQDWbjwKpDf
	HfXlFavSC3qwMP0MeWbrhvjBtvxPZyjoh1rkvjA6KYZmfPRI8+XdF1mbfA==
X-Google-Smtp-Source: AGHT+IGPbOf4XuyMF0AsBeLnGBwdnEWXNj2EoV+2emVuAWbSEK9AVTsQiyZkJ2Uc+nSOpn8J/AtL/A==
X-Received: by 2002:a17:907:f90:b0:a59:ad6d:26e2 with SMTP id a640c23a62f3a-a62641deb55mr561829566b.22.1716806269392;
        Mon, 27 May 2024 03:37:49 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a62a63750c6sm311583766b.161.2024.05.27.03.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 May 2024 03:37:48 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] test-pacbti: Switch away from S = WORKDIR
Date: Mon, 27 May 2024 12:37:34 +0200
Message-ID: <20240527103734.2224649-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 27 May 2024 10:37:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5767

* like oe-core did in:
  https://git.openembedded.org/openembedded-core/commit/?id=d9328e3b0b062f0621de3d114584b44f384a1c02

* it's fatal for parsing now:
  https://git.openembedded.org/openembedded-core/commit/?id=32cba1cc916ad530c5e6630a927e74ca6f06289b
  ERROR: meta-arm/meta-arm/recipes-test/pacbti/test-pacbti.bb: Using S = ${WORKDIR} is no longer supported
  ERROR: Parsing halted due to errors, see error messages above

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta-arm/recipes-test/pacbti/test-pacbti.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arm/recipes-test/pacbti/test-pacbti.bb b/meta-arm/recipes-test/pacbti/test-pacbti.bb
index 331c5854..b0ce1988 100644
--- a/meta-arm/recipes-test/pacbti/test-pacbti.bb
+++ b/meta-arm/recipes-test/pacbti/test-pacbti.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://pacbti.c;beginline=2;endline=2;md5=6ec41034e04432ee37
 
 SRC_URI = "file://pacbti.c"
 
-S = "${WORKDIR}"
+S = "${WORKDIR}/sources"
+UNPACKDIR = "${S}"
 
 do_compile() {
     # Compile with -zforce-bti with fatal warnings, so the link fails if PAC/BTI
-- 
2.45.1


