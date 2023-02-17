Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAA7AC636D4
	for <webhook@archiver.kernel.org>; Fri, 17 Feb 2023 04:31:30 +0000 (UTC)
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
 by mx.groups.io with SMTP id smtpd.web10.259.1676608281540301427
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 16 Feb 2023 20:31:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=gYo3Y1bW;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.179, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f179.google.com with SMTP id f10so4385926qtv.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 16 Feb 2023 20:31:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3bdJrVfe+Jycsb5SjaQYAc0jO3/IC6WAR+aDrZiDUs=;
        b=gYo3Y1bW7nc4hka84maer4HR8x1lXi5agIvuraxS7O6yWx7nBaGE3qM4P7pdPXr9oa
         31si1sMH9zoNMGIOZmw82GdH6xdVqCmpQszNVU3KTCRmh+JFA5DfGKpzHnWZmRjuUM7X
         trRyAi8sziL1cZLiZE0SwbUiw03oyATphtP6Jxj2ZfuInExvCWJAtyZRk3HjZzrFeHGv
         Uu3WBL3wX6HNhQK25AtWzOacZdnZiReDnJOv/vm4S9oIYuNOqHN1KDs2u+sMvCHpl5Xv
         T/PxLt6Wr1dfJy36mPnEehdovaCAFJ41hq70uVxvYXQmxgw1qZh8MuW/xDZ6UZYy1Zou
         G/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W3bdJrVfe+Jycsb5SjaQYAc0jO3/IC6WAR+aDrZiDUs=;
        b=7fnxExuF5N8hSup5ggzo69h8woOxoTdjwLr2n9JOEH/v5aKqHbbHR0oxdoDs87xckR
         8K3le0FxmKmwiZMuWrnvG+IlObCKdz7hWTHlrTdFU+grYrlnXp1CY6TNlMv43SLEleoc
         Ey4+g+euiurZSIXrCORPeOxjkp0NW9qOno3NFoDGyJ5FAjIGv2IgQDwHQAUIEHlVkjO4
         InjNgZ5s9O/NUXCGtOMz8DEbXM81Rfnf0QP5NzarMkaBOzRNEVQh30R9m2UtRd0oAG0F
         TSRWZxltdr6dCvbeOfXMUZZZ9tek1GtEMnS9YoMk0Ap5wMsX0BpvcuBja+IyAbrGUQ/y
         LU5A==
X-Gm-Message-State: AO0yUKWM1VJCq9PH69zvILj6L2ngKxEoy9C1I/904i67w6e5bKPzki7p
	4JySIbBcDN/QAI6DX0apgrSayDBOAxcpJ1dJ
X-Google-Smtp-Source: AK7set/q1O+bkqDGZ33NLiNv2zBtwS8y5LoLqWMucvQR9eBWx1PogT3HCQ2LPV1krsokoS+2CRDvCQ==
X-Received: by 2002:ac8:4e53:0:b0:3b8:1f33:ab57 with SMTP id e19-20020ac84e53000000b003b81f33ab57mr14209904qtw.59.1676608280178;
        Thu, 16 Feb 2023 20:31:20 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id 82-20020a370b55000000b0073b3316bbd0sm2027795qkl.29.2023.02.16.20.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 20:31:19 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH 1/2] arm,arm-bsp/classes: Move wic_nopt to meta-arm
Date: Thu, 16 Feb 2023 23:30:53 -0500
Message-Id: <167660825903.685488.12912138584049367056.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230216153340.1211690-1-peter.hoyes@arm.com>
References: <20230216153340.1211690-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 17 Feb 2023 04:31:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4416

On Thu, 16 Feb 2023 15:33:39 +0000, Peter Hoyes wrote:
> To support using the wic_nopt bbclass from BSP layers other than
> meta-arm-bsp, move it to meta-arm.

Applied, thanks!

[1/2] arm,arm-bsp/classes: Move wic_nopt to meta-arm
      commit: 557e89242eafc19dbe394403619a5a45cbf95142
[2/2] arm-bsp/classes: Use :append to add to IMAGE_TYPES in wic_nopt
      commit: 7fee7ee6009c16479a169422cdb4c2f579a4550c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

