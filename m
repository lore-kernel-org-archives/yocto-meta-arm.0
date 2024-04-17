Return-Path: <vvavrychuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B85BDC001CC
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 11:32:12 +0000 (UTC)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
 by mx.groups.io with SMTP id smtpd.web10.10468.1713353526754897327
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 04:32:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gXuYF+G9;
 spf=pass (domain: gmail.com, ip: 209.85.218.44, mailfrom: vvavrychuk@gmail.com)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a554afec54eso164397366b.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 04:32:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713353525; x=1713958325; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0s1BnHmrKllgphjPNZtA+G088CnlmXOqAK5axkMkF0U=;
        b=gXuYF+G9q2BbC5G9sMTptf2+piVicJeZ0Iv+GU3Q7vejJXAbIfMuTcERiZRW8GkPRB
         8C9x7q04treqrpNshP2OFqK0ivNgigWRNcQ+TBpsofZK67WlqtNzPGl6jY+5Rhj36PJe
         ggoZA89jBXhaAVbiVZelqH20bjIlxQiIPlZDh0aVEwXfCRk2TmJ+IM8+tByP3I4Q63R1
         dQjoOf5470o0TM7ouGYNaAGGTni5RZTr4nI1rpnFTqLp42i46MpA1KgTq0TWQ9sHt4cg
         zUL3V3/4tfGKBKJNWPe+vrJRanP/RcTiBc2002Uu6MhSqls5fCLNYUi3xe6YmFSF9x0x
         B+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713353525; x=1713958325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0s1BnHmrKllgphjPNZtA+G088CnlmXOqAK5axkMkF0U=;
        b=g7vMwh9Rlrn+VbRvkCDXARUO+ZOc1dwU6uPqJ2Dxv03JxMjCNpjGXFHkzZ1j66+LJ3
         vOnaZyrKE9r4Wid7/Z0KAu90JdfVto6KqQPjvzsdiAq2BzCgonhBi/wtDps665hnsftM
         uvzBHuTG28Oc/7pYHGsAmQ9AZnKOTrNWoKsnuqqHK5PrwjKV3iAZgZWrc9OzVMyYawN+
         723X5vx/gkTO87LEfh2Y7RgNk5/7FgUXuVVRNOAif87aNSgUfve1yn7JOSxDWh7biMi+
         wBPFy1xhwU7tWsQyXdZBneWdHsLoLVS8JLzSV5qvI2GUUugYDcaW/qNjPl/eXNEbnFsn
         HmRw==
X-Forwarded-Encrypted: i=1; AJvYcCXbPUIh1O/xCfadRkxTn2Be4mi7UZOqUG8wJ0tJGhe107brF9aSatVU/MHFmdO498K7RRTAfAOzMKqrspYv6QTcud47mEm0fbdC+/LEK4sk
X-Gm-Message-State: AOJu0Yz59aKVDoTzlIDBypGKofql9m+ng9OOPd7uivFBTTk55BvXtjPG
	RwGOuvC58NcNFiYboi/ZraKOcXh3nRSU28X3lnJXCqdQ0T/QyMLM
X-Google-Smtp-Source: AGHT+IGe9X7CfCUObhCezmQeytlPNlT36R8qbQYX823xy9KP1MciLI2dKUBoX6Xh+/iQefoWaK/EcA==
X-Received: by 2002:a17:906:a28a:b0:a52:4795:511c with SMTP id i10-20020a170906a28a00b00a524795511cmr6385913ejz.34.1713353524856;
        Wed, 17 Apr 2024 04:32:04 -0700 (PDT)
Received: from LWO1-LHP-A10856.synapse.com ([213.130.23.14])
        by smtp.gmail.com with ESMTPSA id re3-20020a170906d8c300b00a5559f0f9dcsm623127ejb.79.2024.04.17.04.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 04:32:03 -0700 (PDT)
From: Vasyl Vavrychuk <vvavrychuk@gmail.com>
To: Ross Burton <ross.burton@arm.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arm@lists.yoctoproject.org
Cc: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Subject: [PATCH 2/3] external-arm-toolchain: in libc.so GNU ld script use base_libdir
Date: Wed, 17 Apr 2024 14:30:41 +0300
Message-Id: <20240417113042.91880-3-vvavrychuk@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417113042.91880-1-vvavrychuk@gmail.com>
References: <20240417113042.91880-1-vvavrychuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 11:32:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5558

`base_libdir` gets replaced with `/lib` or `/usr/lib` depending on
`usrmerge` distro feature.

Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
---
 .../external-arm-toolchain/external-arm-toolchain.bb          | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index 27aadffd..ab608128 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -207,9 +207,9 @@ do_install() {
 	rm -rf ${D}${includedir}/rpcsvc/rquota.*
 
 	if [ -f ${D}${libdir}/libc.so ];then
-		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${EAT_LIBDIR}/ld-linux#g" ${D}${libdir}/libc.so
+		sed -i -e "s# /${EAT_LIBDIR}/${EAT_TARGET_SYS}# ../../${EAT_LIBDIR}#g" -e "s# /usr/${EAT_LIBDIR}/# /usr/lib/#g" -e "s# /usr/${EAT_LIBDIR}/${EAT_TARGET_SYS}# .#g" -e "s# /${EAT_LIBDIR}/ld-linux# ../../${base_libdir}/ld-linux#g" ${D}${libdir}/libc.so
 		sed -i -e "s# /${EAT_LIBDIR}/libc.so.6# /lib/libc.so.6#g" ${D}${libdir}/libc.so
-		sed -i -e "s# /lib# ../../lib#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
+		sed -i -e "s# /lib# ../../${base_libdir}#g" -e "s# /usr/lib# .#g" ${D}${libdir}/libc.so
 	fi
 
 	if [ -f ${D}${base_libdir}/libc.so ];then
-- 
2.40.0


