Return-Path: <romain.naour@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EED14E77188
	for <webhook@archiver.kernel.org>; Mon,  6 Jan 2025 10:12:50 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web10.56578.1736158363076195585
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 06 Jan 2025 02:12:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=lCiSWtRC;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: romain.naour@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3862df95f92so6178018f8f.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 02:12:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736158361; x=1736763161; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3a68+5bkkQmGjCa4WZQhK6MsCvQ+PFa+hb95KPhoIBA=;
        b=lCiSWtRCxHBXgk83cENZiiFAahksNjrLu+pFcBTiV8aDMB1kzH4E8KR67T1GJG/3kC
         6mtt89liGRkdn3e1bZlaT+8pSOL2EO7yk5Rz816bXHkfl5rcVHPYeYwURHVwaA+Eafhn
         xMjXbXLr3A3gj1RYdN9tz564zyDykPeNMUXeg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736158361; x=1736763161;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3a68+5bkkQmGjCa4WZQhK6MsCvQ+PFa+hb95KPhoIBA=;
        b=hAkU3vWiJ8k5qdEd1a85BERFZerPU0VRdiJ/7byndJ6ijMPyJ+calNqZqo6Wl5pYjn
         wpUE7RvhxqpaX+c7KGrkoTuQxcH7Dn+X5NCBqetE7J7PmhuYkk9VgELiu4EKhKDsH75V
         TTQeYu4acYI4CT4orC6+BOPxZFqgY3O3E64RHVYpTGloXn6SFdviuDuTqx9WTtcDGxV7
         e/Fgx3pze0/VdB3Eew3IxfFpWYZ96vlUjh+yiHXcuDfJFd56icGyNcfEh/d0W5kTzlTf
         RP37HtNb/QCQHnFX6rgqSCnj/w91KqWiJ0Ec07MLCQWc5tQJznTATxnecYjfKou7pALZ
         Gu1w==
X-Gm-Message-State: AOJu0Ywy9h8PqXlet1Zzh52ck3kBHzNzleBe9cqHxdcMJtWCtBsliAIt
	/IEe2jFQToD6kE8uHqkSWjRQWKJFnLCVnhmgsg7hvYoUKhSyqK954huVs2+dP81LLEARhnduv7P
	Q
X-Gm-Gg: ASbGncvyRvpN4QvgMlet0bkEcR8e81JOe3OgpPyzSqg2b29pvK1xSZrFlvh/SEBNP8a
	IgLp9oo9KkN1uQ32wzxqxACNzyEyk8vFkb7A6h+8Y2IJje8VISIVayk0N+uOC+NCTrzpzEJ8FXx
	Thh6WjkmRWd/WCsJrZpWrKI8WPoSoAadpdQDVlJquNV8W5w+FqBKzkNF+CxIiyS1RvoKVTTwmCu
	dB143CBtbXRinTTSs/NW0FrLRDE6qg3P5/qFiCQ2ffJKuO7OrXHhEoD3XN+pd/nvyBzP//Ug6+P
	e8lLFOYjfeZmE6UAEvc9HIkcqK5P8BBAZINEN2EpeMGGyf7pyUypfg==
X-Google-Smtp-Source: AGHT+IH3PqSrcgT0ykuw6zqu3jYGYEt4p8yHgFesyluudcjJHm0ZLjb6zzuiwGNDF2aQnpsbxhuzgA==
X-Received: by 2002:a05:6000:4021:b0:385:fa26:f0d8 with SMTP id ffacd0b85a97d-38a221e2f95mr51832114f8f.8.1736158361344;
        Mon, 06 Jan 2025 02:12:41 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8ac97fsm46899397f8f.92.2025.01.06.02.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 02:12:41 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: meta-arm@lists.yoctoproject.org
Cc: Romain Naour <romain.naour@smile.fr>
Subject: [scarthgap PATCH 0/7] external-arm-toolchain: backport patches to fix usrmerge support
Date: Mon,  6 Jan 2025 11:12:31 +0100
Message-ID: <20250106101238.982418-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 06 Jan 2025 10:12:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6303

Hello,

The patch series about external-arm-toolchain with usrmerge enabled
needs to be backported to scarthgap branch since the issue was
initially noticed on TI SDK based on Yocto Scarthgap [1].

The patch enabling external-arm-toolchain with usrmerge in gitlab-ci
is not backported to scarthgap since it requires additional fixes
to support poky-altcfg distro.

[1] https://lore.kernel.org/yocto-meta-arm/bf53012b-490d-457d-b6b4-203ce8c44400@smile.fr/#t

Best regards,
Romain

Romain Naour (4):
  external-arm-toolchain: remove old sed fixup for libc.so
  external-arm-toolchain: wrap symlink handling under usrmerge check
  external-arm-toolchain: override dynamic loader path with usrmerge
    enabled
  external-arm-toolchain: rebuild libmvec.so symlink if any

Vasyl Vavrychuk (3):
  external-arm-toolchain: wrap base_libdir vs libdir manipulations under
    usrmerge check
  external-arm-toolchain: in libc.so GNU ld script use base_libdir
  external-arm-toolchain: remove ${base_libdir}/libpthread*.so from
    FILES:${PN}

 .../distro/include/tcmode-external-arm.inc    |   5 +
 .../external-arm-toolchain.bb                 | 125 +++++++++++-------
 2 files changed, 80 insertions(+), 50 deletions(-)

-- 
2.47.1


