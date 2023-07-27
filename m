Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3340CC001DF
	for <webhook@archiver.kernel.org>; Thu, 27 Jul 2023 03:31:17 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web10.62.1690428671146364788
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 26 Jul 2023 20:31:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=HiaWwNBj;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.182, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-76ad842d12fso45088185a.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 26 Jul 2023 20:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1690428670; x=1691033470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KQT3X1FYOaJtoFZH8MmW1H3YtD+hLwnfN05IrpX6FpM=;
        b=HiaWwNBjQwOv9Oo7MhB3Us1ZccvvJjw9AfNU4FSuZiU5T5CIzCPG0VdytniFEPYRAA
         v3FtZIm57ADz7DIR/Iwl+r+2SgvwRt2dPi1HiJ+3bFGc9Rayh+MvyzOiLBgAd9ja1M0b
         gdydCjaYV10l0srlYcWmc8u8pVklPqM9WSwFGqgzS/WVwH/H4xRF4KqXaOiXSuoB77gJ
         iGAscZftypDlCQx1pLvKFvpT938cBYnCA2uvQ22MEUFRRlFKymJcRMWqNTyKWtsF3TIy
         DVZU+gmas4h7AOqYuJZDwRWfD99zhpJPn+ARMUl+miLhGNLG+kZe9YoXA8lw7SdEXb/m
         IIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690428670; x=1691033470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KQT3X1FYOaJtoFZH8MmW1H3YtD+hLwnfN05IrpX6FpM=;
        b=SE2MZCh+ADc/HVtpkxL/FJiDNQp5+6be/oZQEMOF2HUjJKn99udt3cJDZvDPlsS7U8
         m3boI43LnkqYZ+R5RDVsaox+Oh5Ez3veND3xwg1MMgsaFmOAEAmtu9Rxoh8zlTTWa2lB
         ZrS9JCVXw4tREXKabq179VG/jtbWwliuS12C872mrLjK6WwahjMKfmwltBfhrRTcX2Ef
         J4VCvRu+qaiB5mqa78QzU7gLLQlnWDoGDxaXS4iQCnHKK7OO8SovDzLwO9OKquf2jZGk
         EXB3owRvK+tcLwZYLKcOc/QSeshiibut9iMQnSWJx9jSC7Zfjy69ZapuTB+2oetgZm8k
         hSqA==
X-Gm-Message-State: ABy/qLYRAYrNggX6rKnKEVqLO2vOnUjWe5iU13ybS7RTEgK65tC5sElJ
	x36QNe49B/BiZnBVdKt27qbNr+bhnWQ+eNmQx8Q=
X-Google-Smtp-Source: APBJJlEVUcCFGbMCXKURRJNdPUUQNi7JGu+tjmPIWxsiYG4x3J+CDGqJBpcADpReMvSrZ2aDJHMd1w==
X-Received: by 2002:a05:620a:c45:b0:767:f108:c26d with SMTP id u5-20020a05620a0c4500b00767f108c26dmr4218268qki.55.1690428669702;
        Wed, 26 Jul 2023 20:31:09 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id g5-20020a37e205000000b00765a9f53af0sm117076qki.128.2023.07.26.20.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jul 2023 20:31:09 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ziad.elhanafy@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH] arm/recipes-devtools,doc: Update FVP version
Date: Wed, 26 Jul 2023 23:29:16 -0400
Message-Id: <169042855629.3962951.2487010795966518044.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230726190047.138153-1-ziad.elhanafy@arm.com>
References: <20230726190047.138153-1-ziad.elhanafy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 27 Jul 2023 03:31:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4926


On Wed, 26 Jul 2023 20:00:47 +0100, ziad.elhanafy@arm.com wrote:
> Update fvp-base-a-aem and fvp-base-r-aem to v11.22.14
> 
> 

Applied, thanks!

[1/1] arm/recipes-devtools,doc: Update FVP version
      commit: 3cfe68f5ccbcaa1d7b551fd1c7c458563af4c265

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

