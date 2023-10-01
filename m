Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C88FE7848E
	for <webhook@archiver.kernel.org>; Sun,  1 Oct 2023 20:18:57 +0000 (UTC)
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
 by mx.groups.io with SMTP id smtpd.web10.67578.1696191536581726374
 for <meta-arm@lists.yoctoproject.org>;
 Sun, 01 Oct 2023 13:18:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=F8BhK0I9;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.161.53, mailfrom: jdmason@kudzu.us)
Received: by mail-oo1-f53.google.com with SMTP id 006d021491bc7-57bc2c2f13dso5747289eaf.2
        for <meta-arm@lists.yoctoproject.org>; Sun, 01 Oct 2023 13:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1696191535; x=1696796335; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/MqPJMnP0QRG27CSSadb+NPs/iqLTAi0jEHhjPj5zLA=;
        b=F8BhK0I9si5f4u42GHctM1f1LctRa7Kj+NtltMqfr2so/6L8dddQ8ynWpEzekvXfS9
         PZpotYAB77+qoE67B0deo6fd1HFnfHeP2sPDdqY42x/Ms9W1KQ343GW33YIAcQrl7muR
         +A+m+qu11Q4JT2HX/56/E1/pH41xrxcCcY3NM0O2r6cDG8OWpysQBAjyRFl3FPEE6A7V
         Zn+/yhIDk6Rui9ubCitlxtAxzKHVuEobrqsVuUcp69WVNxLAgYLhSMb0w7LjmXwMiRbM
         egbYW2SdrYd60oB1ZJiaPMLQetxuDoN61wTCuE12+DFoPCwSseNWpr1w1ePMacZR10qh
         asUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696191535; x=1696796335;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/MqPJMnP0QRG27CSSadb+NPs/iqLTAi0jEHhjPj5zLA=;
        b=aZ0pBXbBG45Wh9wLd1Xns4/HO/OtTKAK/pIqTviHJySh7NwdS/nAQGSw4Aw4dkotBQ
         Y/x4r12+0/k72pKkSHs477yP52/mFaH6Gve7fYAER1Gm11GhFDQV8ORJfiFORHVYMnFv
         BsGXAZfKseOuKx3NCqckb+A0UqPom9pVA1Osu1/tnzpTuPnpaFM08Zuq++5AHzOykIkt
         geQNB1fLXOOaSRD4tlNrDIh3Qx3zybCjr0p7XmHRyhYj8VXm9NsUAHJjfhHvnNs7NgdL
         LQp68R0YUWlDr8fZa5QVwgTnWeQ/B5PLAUris8264LgciuTCK+BbKbAiotjRpEfMm+Sm
         er7g==
X-Gm-Message-State: AOJu0YyHmqC7giLDZSCFEMHm/Qi9DNt+kgR7kHPagxCf6qP5WePIlVFo
	H+vxZwMZe6NQBY64pyWtpit9nhk6bFjPvZ4cJb4=
X-Google-Smtp-Source: AGHT+IHjMV6gQRUR6bkgWEEUvpgdXm/5Av4l6Be44JpylpHy7DHbT2x0CjWC0hhTgxqSHBaJOohZng==
X-Received: by 2002:a05:6358:292a:b0:143:5697:b682 with SMTP id y42-20020a056358292a00b001435697b682mr10871689rwb.24.1696191535165;
        Sun, 01 Oct 2023 13:18:55 -0700 (PDT)
Received: from localhost ([2605:a601:a684:4100:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id b10-20020a0cc98a000000b0064f43efc844sm2832466qvk.32.2023.10.01.13.18.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Oct 2023 13:18:54 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Divin Raj <divin.raj@arm.com>
Subject: Re: [PATCH] ci,doc,kas,arm-bsp,arm: Remove support for fvp-baser-aemv8r64 machine
Date: Sun,  1 Oct 2023 16:15:20 -0400
Message-Id: <169619132218.3169419.1356129493767107866.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230929132650.442243-1-divin.raj@arm.com>
References: <20230929132650.442243-1-divin.raj@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 01 Oct 2023 20:18:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5093


On Fri, 29 Sep 2023 14:26:50 +0100, Divin Raj wrote:
> The fvp-baser-aemv8r64 machine will not be actively maintained.
> 
> 

Applied, thanks!

[1/1] ci,doc,kas,arm-bsp,arm: Remove support for fvp-baser-aemv8r64 machine
      commit: fd13de4f855d28b9ff289d8a91f4cf7b6b0cdbee

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

