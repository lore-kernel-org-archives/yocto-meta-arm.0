Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36CB41099B4D
	for <webhook@archiver.kernel.org>; Fri, 20 Mar 2026 23:00:33 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1747.1774047624760516649
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 20 Mar 2026 16:00:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=bV6Ko34N;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-43b40003d13so1571409f8f.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 20 Mar 2026 16:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1774047623; x=1774652423; darn=lists.yoctoproject.org;
        h=to:cc:from:subject:message-id:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kBc1gCJQ6OQ8U8m0Hx2z/cuojHqahrcksnim5U2LuW8=;
        b=bV6Ko34NReI/NPZhEn161V98Cp/SRgs+bJHcycJqPWW8wVLU46G0f5dpIHJlfvvzga
         4e4hxnTTyBD/t35lBZdq4gxSFGeF1+npZ+lT6Y8UI0LrUagmJkTImYCQcmlqwgWSSscL
         xL7kCJbj3OSGlLXqQ6sETjxwJ4lcLA29qNg44=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774047623; x=1774652423;
        h=to:cc:from:subject:message-id:date:content-transfer-encoding
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBc1gCJQ6OQ8U8m0Hx2z/cuojHqahrcksnim5U2LuW8=;
        b=RIc0yvG4JI4/qqKpPNUKF96V67A1dBfIiTjX5p4IWwAGR7Td5EysUcCG6mw4iFzAJk
         olgIB6v2O2jgVL2DYX8rMuKcZjJ5J0G3v5pyYWVS0M9dEwlHqnHC66a66eVoGWGeAPSc
         cnmTcIIeYzjMOFFvU4HNc2Tr1MGl7EM1LZoya+cHIxZ3i/n74HseuVb/t1yOuLidO6iQ
         jgwb1VUV2Z7zEFNYeUKp7EQF+0lYqpv3J3lAVMMbeB2zu+v3+M3bTgnlHc8disMUos/V
         tEuFybPZ9z/YkhJBWktcOQAkP2b+oUBwOT3PSjyBRDExm+7E7CO5syFCvMxp9dGT6KVF
         8d/A==
X-Gm-Message-State: AOJu0YyH5U9HOPFVo6qTkVqTYMLZVksRBAuF8IyOpS6HYgro3ZPc7YRe
	2ynaXwIDcwdaBdpLnopyBdFKvzsxfwStel2oM88HAsSl3ddm2LiDtxl1XDPFDWrn5unmzoCpzYW
	MXe/J
X-Gm-Gg: ATEYQzy60dTjrNdAbr9svtYpmmue+QgGv8tUWartzEzCVsFRKTwqe6EulTd/ZVEchXd
	HENf53kLDlnpj4O/TalZsVph+8mq9+SyBm/zfuA0KabVUSFIKiXJQHjKeeDzn+Wkv/IRDrFZuxz
	xUic3fZd2vdGmENNja0eYnJ/d6BTTIo/mAKWTWdi+i+b+tJFJeDNYSObAR3HotIZ1oDrrnTDTAW
	craz+j9v4H5y5e7ax2frJHvC0AYJ/dX7bGSgxmQPGJ0Ee6PvuqqZsasR0AIC+QIuBp+XqLob+YS
	sMZVks3HImkH69gYxyzB7jonI5vSz75DUE/SBMUBa4RYIVKI8mH60QvLhSLlcOeCtMgiLdiRy7S
	LQPQyiXixl2h2dN+mZeikqvG7YwRuKd8Lgf6LeZdQMFeuyKXldgXAKsVilGwYuRkgUWNRU00urI
	83xRoc/7KrnAojJzP8jOgz+1qeVcj/ytLFUBEkhPPm0KOEA28ND4HyjOlzpJ4h7ibI5ztqcDaf5
	7++vEsWvv5dMrnSeolFPc9dJA==
X-Received: by 2002:a05:6000:2007:b0:43b:4e13:2213 with SMTP id ffacd0b85a97d-43b6428baa5mr8420886f8f.51.1774047622828;
        Fri, 20 Mar 2026 16:00:22 -0700 (PDT)
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b644addfbsm10226281f8f.3.2026.03.20.16.00.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 16:00:22 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 00:00:22 +0100
Message-Id: <DH7ZEAMDKDZ2.3W0SJDQU59IXK@smile.fr>
Subject: AB-INT failure in whinlatter/edk2-firmware do_compile
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "Jon Mason" <jon.mason@arm.com>, "Ross Burton" <ross.burton@arm.com>
To: "meta-arm ML" <meta-arm@lists.yoctoproject.org>
X-Mailer: aerc 0.20.0
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 20 Mar 2026 23:00:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6967

Hello,

While testing my whinlatter branch in=20
https://autobuilder.yoctoproject.org/valkyrie/?#/builders/75/builds/3301=20
Worker: ubuntu2510-vk-1
... I got a build failure coming from edk2-firmware:
| make[3]: Entering directory '/srv/pokybuild/yocto-worker/meta-arm/build/b=
uild/tmp/work/sbsa_ref-poky-linux/edk2-firmware/202408/sources/edk2/BaseToo=
ls/Source/C/VfrCompile/Pccts/antlr'
| gcc  -c -O -I. -I../support/set -I../h -DUSER_ZZSYN  -DZZLEXBUFSIZE=3D655=
36  antlr.c -o antlr.o
| gcc  -O -I. -I../support/set -I../h -DUSER_ZZSYN -DZZLEXBUFSIZE=3D65536 -=
c dlg_p.c
| gcc  -O -I. -I../support/set -I../h -DUSER_ZZSYN -DZZLEXBUFSIZE=3D65536 -=
c dlg_a.c
| gcc  -O -I. -I../support/set -I../h -DUSER_ZZSYN -DZZLEXBUFSIZE=3D65536 -=
c main.c
| main.c: In function =E2=80=98ProcessArgs=E2=80=99:
| main.c:163:42: error: too many arguments to function =E2=80=98p->process=
=E2=80=99; expected 0, have 2
|   163 |                                         (*p->process)( *argv, *(a=
rgv+1) );
|       |                                         ~^~~~~~~~~~~~  ~~~~~
| main.c:120:34: note: declared here
|   120 |                         WildFunc process;
|       |                                  ^~~~~~~

It succedded when retried (same whinlatter commit, different worker:
debian12-vk-7)
https://autobuilder.yoctoproject.org/valkyrie/#/builders/75/builds/3303

Regards,
--=20
Yoann Congal
Smile ECS

