Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE193C3DA70
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 18:59:07 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web11.2089.1692298744143327662
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 11:59:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=OkE9eXCq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.172, mailfrom: jdmason@kudzu.us)
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-d35a9d7a5bdso196865276.0
        for <meta-arm@lists.yoctoproject.org>; Thu, 17 Aug 2023 11:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1692298743; x=1692903543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+TLSm3mzqHZDdeqbOYNkn/uhQpmuUKZ2i8UG6Pj35/g=;
        b=OkE9eXCqoXmzcxv+566L+YA34Clm4mQzMFnhquhcFtuxXmvLz7uA4iuROJ3tGuatlY
         RGCEVx/qkR0mNTEH3kzLk/vqt3YxMOFJxxLjBtH+RO/MBzMcoYn1ns2lYaORxC26Pw57
         StApJYKgcUAfeYANYFvVWuMVYairs5pV0K+0i9oDw57SgB4ACDuj5OxgxXqqdWureG+7
         cHPFUJ669hYyfVkX5OCWGKqiZ1VQ12r9eXECj2dM77WZsq6AfYVLEt4FTW9xJ7lN1zml
         i9VSjG0RdvmQdncbJPvH7yiaTts0UK67WU1e1tAdw/PCgwwO25DE3S0p6FhGVob8dj5H
         dAXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692298743; x=1692903543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+TLSm3mzqHZDdeqbOYNkn/uhQpmuUKZ2i8UG6Pj35/g=;
        b=c/Fqiz+rwBA+WUShjSipzFTiOy56aq3xcVw+SAx4I3B5hNmGh2UR43YjHLdV6Yvb8w
         PCs8mRttNfvrjAPH85LIrYhXjK7yzXMKWahQdY8TgC2Rj4RV54f5Gkj8j4DTDlhFrfrk
         i5fI2h/nAvlRWO8lO7sJuaMF/3xtULT0Gud4jV4LCL/9Jc7bi566bScpp9wTpUzs7qql
         PwiUKnP+9d+DK72B6v+NAmtsV/RG8oQOQsl6o4aB+nbIiveb3jvtBvxRa8afMoouFnAQ
         V28cSqNH1kPit0hsY8YeO+nwGMpH8wAsYqgR1IKIaR6X54U9t5yd5I02Zc+TsdC+0ScH
         VgNQ==
X-Gm-Message-State: AOJu0YxLq/hZwehk0mOSvTp4Hcv4o5awMifHxz/NgeE3pAiWdBvHDxGZ
	mhRkWQfLn0fNULKavxwjOKJSAsodp31M1SeSVVM=
X-Google-Smtp-Source: AGHT+IGEdeSYAwQbGPUP0usEoQQm2IxJETwwvBxoRnbDjEOpDae5ovvpiCL9gM1jv6DujZD5rIG+lA==
X-Received: by 2002:a25:bce:0:b0:c39:9e09:2c71 with SMTP id 197-20020a250bce000000b00c399e092c71mr455876ybl.41.1692298742902;
        Thu, 17 Aug 2023 11:59:02 -0700 (PDT)
Received: from localhost ([2605:a601:a68d:9800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id p132-20020a25428a000000b00d17586ff1f7sm24158yba.28.2023.08.17.11.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 11:59:02 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	anusmita.duttamazumder@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/scp-firmware: Update N1SDP scp-firmware
Date: Thu, 17 Aug 2023 14:43:11 -0400
Message-Id: <169229779326.843121.5869587388868076344.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230817093246.96-1-anusmita.duttamazumder@arm.com>
References: <20230817093246.96-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 17 Aug 2023 18:59:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4967


On Thu, 17 Aug 2023 10:32:45 +0100, anusmita.duttamazumder@arm.com wrote:
> From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
> 
> The scp-firmware version in the Arm Reference Solutions N1SDP-2023.06.22
> Release has now updated to a beta version beyond v2.12.
> Add the SHA override for N1SDP to align to scp-firmware version used in
> the release.
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/scp-firmware: Update N1SDP scp-firmware version
      commit: d63b8f806aff0977204590acd47b5b1cfa179008

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

