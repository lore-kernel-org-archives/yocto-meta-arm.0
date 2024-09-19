Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C23D6CF3967
	for <webhook@archiver.kernel.org>; Thu, 19 Sep 2024 20:04:44 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web11.2770.1726776284011073385
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 19 Sep 2024 13:04:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=iioE7eb4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4583083d019so8604231cf.3
        for <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 13:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1726776283; x=1727381083; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JYYU5dpkqbl5hsY6rXQQaN20s2jJK2Xdw+TfTL8GA1c=;
        b=iioE7eb43a4E3Ib1PMM9toNipnIGg/MHNq023emN2FoTdMNUQY31H+DghPxGI+qMlO
         P3STseFe9GeHNRw3mxj7gYP6OyhKNtlGMArMmwNF5DDGB/Dl84ICw2JRUqaa5kAnLKKD
         WhGKZGZkXt+zNKna0XC3ff+5BA1XaD2EawackIOilsF3bG3XUhhXMZEQwBt32z36JOVp
         GJUijnJSNc3kMBQSmzqS6VPzjh9U/YS6LOqhkroEq2kbVsdC1o+6i+GsnZKVgheNo944
         N5hjlbb+7VyHy4KGyLWNfcGVbOYrw3I/BQFTFnUYjpigHIp6WhFrU0C/g65xaktUDwnJ
         ABww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726776283; x=1727381083;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JYYU5dpkqbl5hsY6rXQQaN20s2jJK2Xdw+TfTL8GA1c=;
        b=mOviBbZClJGL0X2ntJcjv5gpM8Fp+OMvVFDAQKdy9WctVAk/oI0ekUEROuOQUSEkGC
         oW5tuMVyGAcq0HetUqqT8RHvWkw3Emlwo7UeS0hFsoyBCN3DfR4O6JQq0GdOJwJhYEtC
         zlzL7l0AJflhGCuwBe6lucGCPPYtzbZSbPo/Ob4sDx5G+aAEl02871lOZKXJIZHh0r0h
         fPq8tHYAdGhG73YYw+GTzawRYcbpPBijliEVrbkV8q45xvinoPCr9hcpjTpodFqZYykc
         HqDIZosGHuSSjtQt5mH+1wyUtWAZ2EzaVM8OIzzcq9SG+MM7jtYPlRKxiGl6sHpyLjY4
         7mYQ==
X-Gm-Message-State: AOJu0Yzg0k3TkFBPWl2iqnXXnuAtVZsAdd4l38Rk2Tp45doNx/St9FZO
	WDcvlHUCdymLOohwghqSbbMvgg5rb0PyzM5zToeC5/uRjmAhyyPNd8dBYmfkAVWdimlqEvSxyAQ
	=
X-Google-Smtp-Source: AGHT+IG1ml+kBRcqCbq/DfW6UAkCEjWkNv0JKOvG63ggKAHKf4BrhTwqfk2D05/S8ztft+NWjILJeA==
X-Received: by 2002:ac8:5a8f:0:b0:458:37c6:46ee with SMTP id d75a77b69052e-45b20555a1emr8460731cf.47.1726776282741;
        Thu, 19 Sep 2024 13:04:42 -0700 (PDT)
Received: from localhost ([136.54.20.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-45b1789cac2sm10464431cf.58.2024.09.19.13.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Sep 2024 13:04:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugues KAMBA MPIANA <hugues.kambampiana@arm.com>
Subject: Re: [PATCH] arm-bsp/documentation: corstone1000: Improve user guide
Date: Thu, 19 Sep 2024 16:04:25 -0400
Message-Id: <172677626879.3549922.11143412800026601990.b4-ty@arm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240912134728.700901-1-hugues.kambampiana@arm.com>
References: <20240912134728.700901-1-hugues.kambampiana@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 19 Sep 2024 20:04:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/6089


On Thu, 12 Sep 2024 14:47:28 +0100, Hugues KAMBA MPIANA wrote:
> Includes:
> * Sentence clarifications
> * Usage of list numbering where steps are given
> * Usage of code syntax where appropriate
> * Usage of RST syntax for notes
> * Appropriate capitalization of component names
> * Consistently use the term MPS3 to refer to the physical hardware
> * Present tests in a clear and consistent manner
> * Wrap commands to reduce horizontal scrolling
> * Creating paragraphs to improve readability
> * Usage of shell variables for placeholders so user can
>   create their shell variables and use the provided commands
>   as in the user guide.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/documentation: corstone1000: Improve user guide
      commit: 5eb457b52626822a13190a359cf927348a0b8f53

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

