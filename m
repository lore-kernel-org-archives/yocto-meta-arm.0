Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8499FE67807
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 17:12:43 +0000 (UTC)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.84432.1766423556591921462
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 22 Dec 2025 09:12:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=DxFIJYUO;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-4ee1879e6d9so46931981cf.1
        for <meta-arm@lists.yoctoproject.org>; Mon, 22 Dec 2025 09:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1766423555; x=1767028355; darn=lists.yoctoproject.org;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUbAAA11+PkuKHsoxSs5Vw6sl3jKresaqQ0sIdWIWNw=;
        b=DxFIJYUOgV8B9VLRkWKhJrNv5czm0eVwabeFQdRca/du5YRIhSSDm6ZXRQdzrs2aHj
         IF6kvKgcX82/iHKH9JA2VSGGwGhB9dQte/Zl8e8cybqcAwORbRo2+Svlx6KtuPd/bA2p
         Uq973C4NrO5yMsOmPWHQhZwH9Obk2DXJ4ybX2HW5/HL7rjAvQAY6sRu4h2zngfR6nxXB
         3kZj3JlaXNVM9GCcTk+l2CFK/EYutlaIhHimxthvdNUvV/+hHGr2YTlhpsm8IbSQKmWA
         6uYFQTd/ICcbnXCflQgUKUUHvdfz6wa+HkGJGJECy4Hm6WQnoDrNxP2R5b8a/NTL4k93
         /4BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766423555; x=1767028355;
        h=content-disposition:mime-version:message-id:subject:to:date:from
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUbAAA11+PkuKHsoxSs5Vw6sl3jKresaqQ0sIdWIWNw=;
        b=NZDuaOZWqxadA0HivAXTsllwIVkdGgYW5kXghm9fef9I+yRlTc3DndqvAp5lzJkbsA
         xEVhYvQur+bEOAr/2fHFRHgBcqrhWkf0EDXdl58H2yHhWa/go1zuf8AqJCB4vkAeIpUH
         FG8nOWHwtC26PfBD4wUnJ+4SGj56hXWIP5oluRry14UhUb+Yvw4ejQSUZ2NnwJVA1hTl
         cehWoEp+y7jRMc1lANfFBaPK8WSYz+DxvHmFOARx5KT5jR6+VlI2jJGXwFWZj9UOo+AD
         XsqgOSEN5CXSNftdEOuPfabQSxOV4h+bpXZ5dcSw7KxF+d1gMIY61Je10r77diVLeSEb
         CujA==
X-Gm-Message-State: AOJu0YwUktx/BZYszIjT6NdkoVe8xLUQCpFsdDP8bwSzSu4o4zs8fHiQ
	NrPHyB4UI9LaR9BRoaa5qHhfnK5/sekeJNUJrjHXQNY/TqOjpv6WwDG9/7DHc6gcO2JzYLa8YQH
	nVrI=
X-Gm-Gg: AY/fxX4D3DDiej9JplxKw2KDqo37dvCTOCV7oErOo/Nw5GvRKfkRiox0bfMvlI8xW55
	fOZaf7Z0fevoHgtvoFXZ84/dEST81GSZxSpd2ZsjlZ5Tu9CzxXPxoYobB4+7dZOuQqMGJtntS50
	WDLNlHtIL4gptYP6apnajBwbamWXr5Kv6mdLQaiyX9vI/oOJwTCPiylmB96yLUbti3I2z7poxAr
	Zsanv9yiVevmM4vw2oDMMdaQywDCZB6oyzUa/OXAgKB19LTj24JLv4edraZJLl6U/cAQDq9XMlr
	iyATtfqsLUBa+zCtLCktXzSKOXar9OiKtHfxv0BjVdcP1zT74piilJn7hJmSjd8xT9tXcOhhYvz
	xb+w+NV+uaxKTydF2q1IPt/GzzCOJrXLCVqtp7JrdRTZMUHkkzeoI1Kjf65ay80Lz+xJuk5y4h6
	8WHA==
X-Google-Smtp-Source: AGHT+IGZA62VBqELzxKdTJiRgauQ0ztOqUDHB+dDL6B73UDQ0F6DScgJDP4BKyBb2BJW2rSCSft7KQ==
X-Received: by 2002:a05:622a:259b:b0:4f4:7b79:72ef with SMTP id d75a77b69052e-4f4abd6fcfamr192137381cf.53.1766423555203;
        Mon, 22 Dec 2025 09:12:35 -0800 (PST)
Received: from localhost ([136.56.27.188])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f4b6760a43sm64476231cf.22.2025.12.22.09.12.34
        for <meta-arm@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 09:12:34 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jdm@athena.kudzu.us>
Date: Mon, 22 Dec 2025 12:12:34 -0500
To: meta-arm@lists.yoctoproject.org
Subject: meta-arm whinlatter release
Message-ID: <aUl8ApZuUklljUu3@athena.kudzu.us>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 22 Dec 2025 17:12:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6809

meta-arm has released the whinlatter support branch.  The branch was 
forked on 22 Dec 2025 from the master branch and was tagged as "5.3".  The 
tag is GPG signed and my public key can be provided if someone wants to 
use it to verify.  Per the previous public discussion on this list, 
whinlatter will only be taking bug fixes and be passively maintained
(with scarthgap being the actively supported LTS).

Per an external request, we have duplicated all existing numbers only 
tags (i.e., 5.3) with a yocto-x.y.z tag (i.e., yocto-5.3).

Thanks,
Jon

