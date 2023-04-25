Return-Path: <peron.clem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94670C77B71
	for <webhook@archiver.kernel.org>; Tue, 25 Apr 2023 13:39:08 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web10.79844.1682429941931452700
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 25 Apr 2023 06:39:02 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=SJHCm6pX;
 spf=pass (domain: gmail.com, ip: 209.85.128.47, mailfrom: peron.clem@gmail.com)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-3f1738d0d4cso37479815e9.1
        for <meta-arm@lists.yoctoproject.org>; Tue, 25 Apr 2023 06:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682429940; x=1685021940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hj/jslxcWa8H5w9gXLWCcs4McoQY+NNIApLYHpQT1qE=;
        b=SJHCm6pXtSJg24OWWXkJbJ0pDYYtDvgOeocIfUUwCl3odqDd59jz9SgqQVyv1hYWZe
         v+21iz9PEwLaDuOUwsqpD1F2gdx7eVuoIH2uB/pToD0G4vr4tOi+wFolLlujqPl6Uaq+
         SGwY5+c4Nqr1eoem5PLK1E+4NJL5mhquUwvzcp/MIGAhZqTc+AO6soCV5I4ZGZPcBQpN
         8cQSPcOhAxpKkxDGsIeDg0/rQeaKURuG29WmCmzDg+AoEFDi3+yn9Yuh11LCF/cPONYf
         D9KpDscDfCpoQ8X5iYaSvWqjo3tgwoaIrKnOlnufTRoyfZHZkqTQHxb8K7Wq5vJXcX/8
         guuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682429940; x=1685021940;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hj/jslxcWa8H5w9gXLWCcs4McoQY+NNIApLYHpQT1qE=;
        b=eFNmoTZ29CWafyBfJi4sUNDCloQiLACtev5cZCLaNjhbexs9tgGEAhzO2A1EAnGFT8
         5UZbsjaNWbR+Wqj48RIO1fSdbRxB/NB9PjosXi5ZKiRZo+mi0sv2v2gDhx31zNdq/5RJ
         zIN2QL1UvCMfz+C7RxR3taan77QFs7ImrKIMk3PuYzL9uXPDgWI6FlCKoz4X1h5ipJIU
         pMFP5qqZXoA34RAhR8KulGZ5u+nz1JTc2hA+JUySk6PaaYqykb1LibnrgrRweM5AQ1ji
         cDKwd4EJPS6tiDWtDBE8aR/SggwbhhEgnVfFZ0p1xAdwDmPDdlwzmllHpYVEGOiTroCC
         VAPQ==
X-Gm-Message-State: AAQBX9d5ntiSRLtW079Z9oEUKur7/U6h7aHvswOgm6wq+Sg4PObZca5h
	Ln32MlG/oEqwwGWDXGY/QNnVhdUtVHA=
X-Google-Smtp-Source: AKy350aawdBaWPZwhd3QFgkG0TAmSPh4VHDtJvH7Ahe+jrrHnLF8D64sG3x8+cnjDYob9y0slXR64A==
X-Received: by 2002:a7b:c016:0:b0:3f1:6fba:b69a with SMTP id c22-20020a7bc016000000b003f16fbab69amr10671327wmb.11.1682429939794;
        Tue, 25 Apr 2023 06:38:59 -0700 (PDT)
Received: from Clement-Blade14.outsight.local (lputeaux-656-1-11-33.w82-127.abo.wanadoo.fr. [82.127.142.33])
        by smtp.gmail.com with ESMTPSA id h19-20020a05600c351300b003f1958eeadcsm10936459wmq.17.2023.04.25.06.38.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Apr 2023 06:38:59 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
To: meta-arm@lists.yoctoproject.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Subject: [PATCH v3 1/2] conf: layer: add dynamic-layers folder in meta-arm
Date: Tue, 25 Apr 2023 15:38:56 +0200
Message-Id: <20230425133857.27753-1-peron.clem@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 25 Apr 2023 13:39:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4616

Gator-daemon recipe will require libmxml which is present in meta-oe.

Prepare for dynamic-folder support so only people that have meta-oe
present in their configuration will be able to compile this recipe.

Signed-off-by: Clément Péron <peron.clem@gmail.com>
---
 meta-arm/conf/layer.conf | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta-arm/conf/layer.conf b/meta-arm/conf/layer.conf
index 2b354375..fb121888 100644
--- a/meta-arm/conf/layer.conf
+++ b/meta-arm/conf/layer.conf
@@ -15,6 +15,12 @@ LAYERDEPENDS_meta-arm = " \
 "
 LAYERSERIES_COMPAT_meta-arm = "mickledore"
 
+# Add layer-specific .bb/.bbappends
+BBFILES += "${@' '.join('${LAYERDIR}/dynamic-layers/%s/recipes*/*/*.bbappend' % layer \
+               for layer in BBFILE_COLLECTIONS.split())}"
+BBFILES += "${@' '.join('${LAYERDIR}/dynamic-layers/%s/recipes*/*/*.bb' % layer \
+               for layer in BBFILE_COLLECTIONS.split())}"
+
 # runfvp --console needs telnet, so pull this in for testimage.
 HOSTTOOLS_NONFATAL += "telnet"
 
-- 
2.40.0


