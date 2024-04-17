Return-Path: <vvavrychuk@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F8BC04FF9
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 11:32:12 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web11.10564.1713353524056924337
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 17 Apr 2024 04:32:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Fcdgb2QX;
 spf=pass (domain: gmail.com, ip: 209.85.167.54, mailfrom: vvavrychuk@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-518e2283bd3so5556485e87.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 04:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713353522; x=1713958322; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0O4IqlUdv3HQjscdUpnOGNPWzQt7Aj8aypUzIJuro2E=;
        b=Fcdgb2QXYamUgDk4/oGFBtEH7y3VKU9ZhFA1xjh+6N7xIMLWFtHnTz90eGQukV6hFA
         IsUtc55YkjOBeKsQ0MckB+TNLJfMuBv90LAgXgeWtiRkRESbOpW7yKz3YEaCP11E2qCz
         +YBkMaFieZNsJjtNyul5emYeSXiKO0BTdtvUF16/CN9NeZO7FoGJFAkugeKdNYgOuaVf
         qNem4uzlQhvKIqxAWAJYnanvvY700sJBSMFGKznwbqwI3xB9T14ZZtF/RFBMQs0D73eB
         FoJDo6I2jNGpWPXW6vcqMwem0qwVnYU6cVUykdFNGJT/aJm39c5MVtW97mF1uIphzad5
         YPfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713353522; x=1713958322;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0O4IqlUdv3HQjscdUpnOGNPWzQt7Aj8aypUzIJuro2E=;
        b=SrEnuhHoJFoYm6Jfx0UqzgCwxxozDZHAquGAP0eMrxXGWNyPCuxBrlA6oiWh97yill
         CXQ0fTn8VvCBvzmy6NsHq5d2KQAxLv5C8oIyX2HfE78UexyHNHRpjx/+WQsQuY10OJef
         4nnkb/eWm5KkbwrBhvxSFlGMIP2+l0rMt34qpw8yPSmHr1pbACX62IIa/A8r/H1+UVHk
         +JHj7EHqr0gCaOkpNYBgo5kIw5B19ZdhaJy6WR2ZsdE8Tic/yr3raiK36w5jf38waaMa
         n5yerQJqY/OgbctPjlSaxF0zkpouqil3ZUZlYWJLg6+BO32I5c/Y9nqu1FgFtJOYRCyU
         Gy0w==
X-Forwarded-Encrypted: i=1; AJvYcCVBbZ66oRe7AehuXVHZeG5Dlk8wte9HMv7KPtST6pjmTBoARbi3MFRHiJTegOOWDKUiEJT/7wbDkM7ne77/S3FdmyHHIdlQmzgTpvnZa1KM
X-Gm-Message-State: AOJu0Yyj5QcgZWr64JlvLxjyUXad6Gz+9TAF197t7atf+f1+oSp4v+70
	oaDZFaxLaHvjcSZJFh1oLKwPPzs7trX0YyE2tlJm4sdh0iXMIBqP
X-Google-Smtp-Source: AGHT+IH6nPfk/j/37qPY7yWkaxiU5oKILHpHLl/snvHmk8A2GlthEVB6uKqcwYT2NULAX5pBk17jnA==
X-Received: by 2002:a05:6512:138a:b0:519:138c:622a with SMTP id fc10-20020a056512138a00b00519138c622amr6099614lfb.59.1713353521356;
        Wed, 17 Apr 2024 04:32:01 -0700 (PDT)
Received: from LWO1-LHP-A10856.synapse.com ([213.130.23.14])
        by smtp.gmail.com with ESMTPSA id re3-20020a170906d8c300b00a5559f0f9dcsm623127ejb.79.2024.04.17.04.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 04:32:00 -0700 (PDT)
From: Vasyl Vavrychuk <vvavrychuk@gmail.com>
To: Ross Burton <ross.burton@arm.com>,
	Denys Dmytriyenko <denys@konsulko.com>,
	meta-arm@lists.yoctoproject.org
Cc: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Subject: [PATCH 0/3] external-arm-toolchain: fix build when usrmege enabled
Date: Wed, 17 Apr 2024 14:30:39 +0300
Message-Id: <20240417113042.91880-1-vvavrychuk@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 17 Apr 2024 11:32:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5556

Vasyl Vavrychuk (3):
  external-arm-toolchain: wrap base_libdir vs libdir manipulations under
    usrmerge check
  external-arm-toolchain: in libc.so GNU ld script use base_libdir
  external-arm-toolchain: remove ${base_libdir}/libpthread*.so from
    FILES:${PN}

 .../external-arm-toolchain.bb                 | 67 ++++++++++---------
 1 file changed, 34 insertions(+), 33 deletions(-)

-- 
2.40.0


