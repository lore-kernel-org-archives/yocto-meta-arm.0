Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DC482C433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 13:22:57 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 by mx.groups.io with SMTP id smtpd.web08.11274.1639056177098024484
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 05:22:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=NUkhlFgu;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.177,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f177.google.com with SMTP id o17so5284308qtk.1
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 05:22:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L7BhzHHHEfwZm9cq9tXsfpHHZevH9qYmoWYouCtLOUE=;
        b=NUkhlFguG7U38aVMc2Vx6iB8QHuICEe34TsYl0PK5qt5Cz0KkCewx49FvHdLaqgKSn
         CJRKj64ENu37ZpQSy6LsumcFOIk5hnTih5NTm30++ixK93FZIgdpJ64BFq2sitRcuzBh
         rf6kZbLXX7ZWNLmCjL7jzY7H/zWVJiKXrHF/e7vDTmMOELiaBD+nce1hCsunhhksW16Q
         tdnQU2xcNcS2qVo9qH56IBUVAERJC6L+JBM9LR6JA+YUvSlIXp6UxECGkXUwRTkPoEBt
         X53Mpyy8SweL4shVdj9H5yK9jgpRKzYzJVA5KIpEDgvY/eLlONIxZR2ZcNxiAwOUn8B9
         vabQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L7BhzHHHEfwZm9cq9tXsfpHHZevH9qYmoWYouCtLOUE=;
        b=s8Xtr7kQhXoMGNAwJfK8NF48rQlmNk+/CfOz4gfT+rcqjhqbu+jQfy0IphaZ2Mg3Ar
         1jopNIKLvFkE64Me3qtYzSq5z8Bvatyu5QW2EpqILpvTf/osFRUJ8ewAbD3blFy0z0vj
         43YowKM7KZiOCCIvRRI2zWCugFXudnoeVq58LtPRTsEue3Z09DniFgTaetpiLMYgHrAE
         KeW4QqMV3Ck96Sm7vYyux9X4OLLjz9vq659cZ6XLcFQSYUD2IGshcb/+TBFHbdM5phhq
         Ry17+9hCjMJ6+UVg+XgD9kkLQmqJ8+wKwPG7lADMAv/itaGB1Gpmk6xEWfVZc8k/qfFj
         23YA==
X-Gm-Message-State: AOAM5317MF4Wm3s2IMEVtQILc70cGUgLUClJGC67psZ5QqNuTiF9KHqG
	ImcMSQ26jDpu0rosyzodjEweLtLGUbX2gg==
X-Google-Smtp-Source: 
 ABdhPJx6X6loMOQRxdi7CPZzzP0o4fJAH9Hu2pN+iDlHoFi+AJiSBMhOWfNzidF/OSxj1dDd7dRsgg==
X-Received: by 2002:ac8:5dcb:: with SMTP id
 e11mr17210234qtx.559.1639056176135;
        Thu, 09 Dec 2021 05:22:56 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:28c4:a17f:5953:8cab])
        by smtp.gmail.com with ESMTPSA id
 z8sm3937154qta.50.2021.12.09.05.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 05:22:55 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] trusted-firmware-a: Mark qemuarm64-secureboot as
 compatible
Date: Thu,  9 Dec 2021 08:22:50 -0500
Message-Id: <163905617157.9690.8682153317354913740.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208201732.3000425-1-raj.khem@gmail.com>
References: <20211208201732.3000425-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 13:22:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2579

On Wed, 8 Dec 2021 12:17:32 -0800, Khem Raj wrote:
> qemuarm64 fails to build since PLAT=invalid when MACHINE=qemuarm64
> 
> 

Applied, thanks!

[1/1] trusted-firmware-a: Mark qemuarm64-secureboot as compatible
      commit: 67332589e0cbe4b93267589cd52dd0b9f2679cfc

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

