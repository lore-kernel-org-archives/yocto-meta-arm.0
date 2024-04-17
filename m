Return-Path: <vvavrychuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DCADC4345F
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 11:32:22 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web10.10469.1713353528048330523
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 04:32:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=giSnFbY1;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: vvavrychuk@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a4702457ccbso682541366b.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 04:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713353526; x=1713958326; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M1eAJt/LARM+zuJMYSE7aQc3GI7L7iFs1JUy6c0hrhk=;
        b=giSnFbY1OPi/5liqB3C9J2qvP4ILgooiPhvi6Fl8BlVayRc8x77NGrcpWdD4NED8aL
         ZScxwpoUftmrZE4K/1hL22Vmhr6Oh3f94UZg9K8n/4TntKH2BNJEm4k6Le0RSTNk4GpV
         paBkN75bEhIG+Ut842DISxmXWYQfItxBkxBq37a1+ylenPAkGM2C7qtKyq9QI9kyhivf
         zQ65TZGD8pIN+kBFJdl+fDP9hMQYIv6gX0x9fJD93kXwLU9pYlmcKahRFW2+dHv4WJbz
         QT9OjzEU25OmZXHR4+WwkkE4gULfaNG9Tk3aFSVi2irdLnp6CuAaIRoffD6H2TGx4ey0
         CdpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713353526; x=1713958326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M1eAJt/LARM+zuJMYSE7aQc3GI7L7iFs1JUy6c0hrhk=;
        b=RHf+NIi48J9vj3MeIFdre4705JTTotOVjd4QfpnRFt1aAcUmjMwH7mFb37QxeNx+sg
         HCcBikoUl34US6FQKAxdM96/tcJJaYNqmAaBwpmtoVcXk550PJZ2LoO5JuxRfEe2GU0z
         AQh09S+dSuNUOYwro5x4Bk+8s+ya3SFPs/AEluI1JRbABwmfzTEN4ePuqn1SE0KziPvm
         WU3VSmk1ytD8BUJ1BibsMFde1yN14O2CQiHFivP0oV8y/SogqVXgWkfEWPQqP/pwVPA7
         YIToVQCmcRSokghu0UZAUSEDW1aDa2EF2IAXK8WhGWD6KBcb7I6DV780mgOqXLO8Lai6
         J8pg==
X-Forwarded-Encrypted: i=1; AJvYcCWIZ7vWxSAAb4HYYkOaOigSIias24VF5/xYvZNCt2ky7gftwKX8h/pGQo7GtjtpLhehmXXXhGOAdCYjwo1nKnZfWLyPl2duUIuKAzQwzIFl
X-Gm-Message-State: AOJu0YweEmgUy3UsPfBd51c/XHCunW22sIVe5aLHyabtukxJGOoejw/6
	T2Xtt5EK54Tqq4/he6HJWuOAMiK77oxyR75ytc+1LkuSVbck2FrO
X-Google-Smtp-Source: AGHT+IFEjrRqGbb/4tChoKVOwQ+GbrVaUZoyqqUIde+8LC93LuYDvjWMCjl7WTIjY0XaftH/O5lWgw==
X-Received: by 2002:a17:907:6e8c:b0:a4e:3fad:b973 with SMTP id sh12-20020a1709076e8c00b00a4e3fadb973mr12290021ejc.65.1713353526106;
        Wed, 17 Apr 2024 04:32:06 -0700 (PDT)
Received: from LWO1-LHP-A10856.synapse.com ([213.130.23.14])
        by smtp.gmail.com with ESMTPSA id re3-20020a170906d8c300b00a5559f0f9dcsm623127ejb.79.2024.04.17.04.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 04:32:05 -0700 (PDT)
From: Vasyl Vavrychuk <vvavrychuk@gmail.com>
To: Ross Burton <ross.burton@arm.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arm@lists.yoctoproject.org
Cc: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Subject: [PATCH 3/3] external-arm-toolchain: remove ${base_libdir}/libpthread*.so from FILES:${PN}
Date: Wed, 17 Apr 2024 14:30:42 +0300
Message-Id: <20240417113042.91880-4-vvavrychuk@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240417113042.91880-1-vvavrychuk@gmail.com>
References: <20240417113042.91880-1-vvavrychuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 11:32:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5559

When `usrmerge` distro feature is not enabled, then `${base_libdir}`
resolves to `/lib` and `/lib/libpthread*.so` does not match any files.
But, with `usrmerge` distro feature, `${base_libdir}` is `/usr/lib`, so
removed line leads to `/usr/lib/libpthread.so` symlink included in
`${PN}` which causes QA check failure.

Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
---
 .../external-arm-toolchain/external-arm-toolchain.bb             | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
index ab608128..f0955b29 100644
--- a/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
+++ b/meta-arm-toolchain/recipes-devtools/external-arm-toolchain/external-arm-toolchain.bb
@@ -528,7 +528,6 @@ FILES:${PN} += "\
 	${base_libdir}/ld*.so.* \
 	${base_libdir}/ld-*.so \
 	${base_libdir}/libpthread*.so.* \
-	${base_libdir}/libpthread*.so \
 	${base_libdir}/libpthread-*.so \
 	${base_libdir}/libresolv*.so.* \
 	${base_libdir}/libresolv-*.so \
-- 
2.40.0


