Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 368CCC10F05
	for <webhook@archiver.kernel.org>; Wed,  6 Dec 2023 14:17:38 +0000 (UTC)
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
 by mx.groups.io with SMTP id smtpd.web10.32676.1701872256576901489
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 06 Dec 2023 06:17:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=pk5nDsOt;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.176, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-423e77aa09cso5813901cf.1
        for <meta-arm@lists.yoctoproject.org>; Wed, 06 Dec 2023 06:17:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1701872255; x=1702477055; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FNSvz496VVt+PVHDhJI8ATBvRCK2Eit2cqUt4sef5mg=;
        b=pk5nDsOt+swHGJIyNrJyXdN9aMC8qvofXUeTnNdcv8gIzn6XKY54GBi4k+V+P0hZPg
         tfvBvjWg05zMk+Tikn6mUiwNNlzfQeC5yZGtywPfcIs6gym8UY9piimFUHISU7VS5m+t
         jiK2/5ARCtHSmnkaJdSYHx2od83fMVndzBcSnoTRvpltx6OZpwmbk+XUKwh4QdVIv3T7
         3qIjVevJiEGTttwtRbV8S4heQ+w+Q+GGvG99cuv0bw3JEudx5iy/3lCTmBXYouAQi5Py
         on43K37skhrzhKucuqXQSakLyHKu5/YBLDEoi9bv9DIX0qMqdJJvYjZeQzjRsPMiKQId
         omsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701872255; x=1702477055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FNSvz496VVt+PVHDhJI8ATBvRCK2Eit2cqUt4sef5mg=;
        b=bnd74a/njDlwcuFib8tPkfev4QQzcGZ6NaZyb6Q8Ed+dA/Qp2rrj21YncFVY7vudSv
         9FT6sc51EJIjWuzYcm03eyGGWEQlgeJLm/GyKUWQcovWE+Bd3oOGh91v7AgGq4zl4GR4
         L7FDRr/IYnMBa6YfvnYy6JKU/96GpWnz90GDkAKgUXqICT4GxgBPO+3xKZLs7qytnv1j
         gXyEM2+WDSAfpVVGAed+DHyeMlGmufpYYnzMN0gZz0HRVu6qHzh+vzaRm2CwHvkJutbV
         NTXr0ygymZnzYoKazCDPmSdpqzylbj66vP3evTYe4xH8ia0uZkbd6U7ELR+qK35rDhR/
         +K7A==
X-Gm-Message-State: AOJu0YwNZksiA5U0DHGEAi/o74uA5v0uB5Pw2IvCFfpAJZhCa4XWwxoz
	km8s4dKUAS5junkQfCKvs3yqVhXnt5ZD2flaD2A=
X-Google-Smtp-Source: AGHT+IGqx1cZFr/FqYcUW43yOGPCUtLyoiFAdZvWU62T4SLKD46HpTN/YfRO+0+aP1n58OtGittv+w==
X-Received: by 2002:ac8:5f81:0:b0:425:4727:d65a with SMTP id j1-20020ac85f81000000b004254727d65amr1163532qta.31.1701872254927;
        Wed, 06 Dec 2023 06:17:34 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id f6-20020a05622a114600b0042543fb2537sm4036367qty.26.2023.12.06.06.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 06:17:34 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH 1/3] arm/trusted-firmware-a: move patch file to bbappend
Date: Wed,  6 Dec 2023 09:16:37 -0500
Message-Id: <170187219916.257200.9936289494400677988.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20231204171952.13471-1-jon.mason@arm.com>
References: <20231204171952.13471-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Dec 2023 14:17:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5297


On Mon, 04 Dec 2023 11:19:50 -0600, Jon Mason wrote:
> TF-A is being patched in the recipe for qemuarm64-secureboot.  This
> should be done in the bbappend.
> 
> 

Applied, thanks!

[1/3] arm/trusted-firmware-a: move patch file to bbappend
      commit: f0d7b9db317e72300b71184014573564a2787cd0
[2/3] arm/trusted-firmware-a: update to 2.10
      commit: 3835b78f03ab7c396323b6f5b0d52184e2ea3ca7
[3/3] arm/hafnium: update to v2.10
      commit: 560075f050cecd1591834efd9a4d949dbc6ff355

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

