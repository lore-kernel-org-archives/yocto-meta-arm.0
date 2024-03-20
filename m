Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7125C54E58
	for <webhook@archiver.kernel.org>; Wed, 20 Mar 2024 13:56:22 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web10.45086.1710942973811099580
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 20 Mar 2024 06:56:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=Mht2abG3;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.171, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-609f24f447cso73473737b3.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 06:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1710942973; x=1711547773; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZAgmmo9fIaV/SdfKSB20xygCwRUVXbnFFN8hzoKSiU=;
        b=Mht2abG3ZWyr9H/dgzzCfQs0c92HgYOJaWeYELYXuc1MoEmVAx9ryS4rSfQ+LNp1WW
         T8W7GIb2jeBfhrnT5mntZzyo/vBqo7Lr7UmM8RwBFx01Ovl37HtsaZ+LqlJAIY53xomU
         Rm9n1LgufT24lggfwr13Rw+BvDRuLHRDJ4wS3Np1FjOWMqWgNVzOSqJVULp9xVTG3FbW
         XkdKQz8RljND8YkOjTVhhoE6yOB5jERBY7rJES8j0xLISZOS1GSkRx5luYe+/xCOuhah
         70G/MC0gt0Bg+zyEguthY1j8Kf8lSRiXf9/Sz7fs/6MmOHNW4kTNNOlw6qDstf+AkHKJ
         WjEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710942973; x=1711547773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YZAgmmo9fIaV/SdfKSB20xygCwRUVXbnFFN8hzoKSiU=;
        b=S/kUKe4xpNH48LooYjq6E0+y1gnS+1qmpGEAkjnhT7xiSA/Mq02nwQ4jmCuAwz6BSt
         bN/54nr3Tds6RDFeLmP+Dg/mvcbEHW7noq17mLAEe8h/N2tOGYRbXKRbpGzrGHblZRHZ
         7MmQG8U0lNh7gJY21lYYxtBxRPXi4eHJ6yRVf/HpEmRJq4zwSdFwpFQmdNB9Ql7LHODA
         WlupmNG23VXBOZBzIB/3wXEXFqBu/emMMc2mjvwYFNSoRjG6m6TK3F64l/91PHzEoYlb
         lk11qTqxBakz/zEGe3VJLtagafN85+okgAGQBplk4yAHKV0Bhuyj87ufaNfL+YP6ACKB
         qMXA==
X-Gm-Message-State: AOJu0YzLFn//82k6lmuIf4e0+/Qk8uvN/pHCR0wuBBd2s/ah9Av6oTsZ
	beBtFiIftuLDDIAUFIsFArBGw8GRHQctPmQMghdVCJov6oxAHd5VopLobwMACid2v9OkuNL92Hc
	=
X-Google-Smtp-Source: AGHT+IEFqogBGy8CgDv2PHchckLSjNNXnugLWM3pSbeEekfJuxykFVk2XSOZWkT6xzYDgQT/q3VZaQ==
X-Received: by 2002:a25:b203:0:b0:dcd:3a37:bdb1 with SMTP id i3-20020a25b203000000b00dcd3a37bdb1mr13638057ybj.44.1710942972634;
        Wed, 20 Mar 2024 06:56:12 -0700 (PDT)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id jr2-20020a05622a800200b00430a44f49dasm7068959qtb.7.2024.03.20.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Mar 2024 06:56:12 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	emekcan.aras@arm.com
Cc: Emekcan Aras <Emekcan.Aras@arm.com>
Subject: Re: [PATCH 0/1] arm/trusted-services: Add recipe for block storage service
Date: Wed, 20 Mar 2024 09:54:31 -0400
Message-Id: <171094287482.3509794.2190163398161262444.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240314155920.345936-1-emekcan.aras@arm.com>
References: <20240314155920.345936-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 20 Mar 2024 13:56:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5461


On Thu, 14 Mar 2024 15:59:19 +0000, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <Emekcan.Aras@arm.com>
> 
> Adds a recipe (ts-sp-block-storage) to build the Block Storage
> secure partition to enable feature development for downstream users.
> Emekcan Aras (1):
>   arm/trusted-services: Add recipe for block storage service
> 
> [...]

Applied, thanks!

[1/1] arm/trusted-services: Add recipe for block storage service
      commit: 6cd998d411d61b976d65e5131194b2de897d6a1d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

