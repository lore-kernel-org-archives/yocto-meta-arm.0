Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F980C52CDA
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 18:59:37 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web11.2102.1692298773287335516
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 11:59:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=J27GS9Rz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.167.174, mailfrom: jdmason@kudzu.us)
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-3a80e665410so58337b6e.2
        for <meta-arm@lists.yoctoproject.org>; Thu, 17 Aug 2023 11:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1692298772; x=1692903572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trsFpMN283eQSsfpEALAvOh3ArtqJHo54u41g172sLw=;
        b=J27GS9RzBsM6SyHSvkej6xxz2EVFMeYD8wTNd5SVgDsODZgxCFZ5TA+NYBQY6lfR9y
         ElH6YGxBw51YoGnQ+A7Lr9uzaue9GGmrU7Q/QyED/ZDIJW3PsGej8QJEKppKr6L+ylSo
         +E5O/L7gMN0+k1dWvX2sn42UOfiZqBycGhg47WvU9PFgTphO3So2mg+9FXYYimbmm/jW
         9XRhi94y0VA7zMFHPBG87MdHG2ACC0z/kA1r7v2rhc8bKD3Ia5NXJeL5IxPKzpCnMfof
         YLEIYS6p401iosh6ewZyy/2R592bYUuqwWIvb+mSFHEUtNIkhaFgXsqX/L6gTjj8cdPo
         /YIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692298772; x=1692903572;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=trsFpMN283eQSsfpEALAvOh3ArtqJHo54u41g172sLw=;
        b=JJgqh/2N2e03OJzMO+y0/KnasY4AVyethk1dbjSSVfhy0pK42KyiQjD3VTgpjZCC8O
         K1JXJyUFhraExc5bLm7Z2hi6r4tPx7+lcMHjkyaKIiUp5YQjY0HG18V6C12+voikKOrb
         NVfrdlHcJx7tDYnFb2is3nVTWk6nR3jZd3Z82/c0BzaaUR9ljy6/4QMDR5eo4FqoqkxO
         XrZIb6Z/jHr94B0Y2J9XYzfjDuXxYY/7Ti1s0fAxkcgpCIymHtEBEtofVUOxuFihv78h
         yoL4XIh3mF3Rp5WynGG13V2Cjm3NyWIq97UOxAxyvokiCOGQTkYRsqBPjlJMM2/jZ4zq
         10vQ==
X-Gm-Message-State: AOJu0YxOfoVmZ4rjCDtjowNi7JPSXmzM4FncDkl9gDTui6M6mn0fxpMe
	uobXqDXKz3Z6fYhzQTwnQvls+3fWQTJS6HsmQAc=
X-Google-Smtp-Source: AGHT+IF8VkFWfS2IOTr7sCTycphy+S4Z0gL5NNGaRDhyf32UXcSRh5nFAaVBHkJf1sQaPlmuQlI/lA==
X-Received: by 2002:a05:6808:f09:b0:3a7:8725:f37c with SMTP id m9-20020a0568080f0900b003a78725f37cmr606303oiw.10.1692298772141;
        Thu, 17 Aug 2023 11:59:32 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id n15-20020a0cdc8f000000b0063d2ea55018sm72283qvk.125.2023.08.17.11.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 11:59:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/juno: update kernel to 6.4
Date: Thu, 17 Aug 2023 14:43:13 -0400
Message-Id: <169229779326.843121.5765767057644339900.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230817155127.3634849-1-jon.mason@arm.com>
References: <20230817155127.3634849-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Aug 2023 18:59:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4968


On Thu, 17 Aug 2023 10:51:27 -0500, Jon Mason wrote:
> Juno requires no patches to build and boot with 6.4, as the patches
> present were backports.
> 
> 

Applied, thanks!

[1/1] arm-bsp/juno: update kernel to 6.4
      commit: 2ac07293aa36019577562213f321f36d6fcfd316

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

