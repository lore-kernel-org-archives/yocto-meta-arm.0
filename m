Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E7BFC433F5
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 13:33:13 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.10796.1645191188348450777
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 05:33:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=0yVbN0aM;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id n6so14673432qvk.13
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 18 Feb 2022 05:33:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XDPk6xw+mW+ICS9zBRfnJ1hcJqJGLgpdBuPOzpKOvuw=;
        b=0yVbN0aMOV/gJZQAi8OS6LRTS0DPHfegy7qBZiUiDaKyUCHL8HM3pLPIEq+BYVlXLL
         Znx36b+G9gecVLkr7lASaVsoISapIEzv8tYTC6D+Nq7xUg/AgpLtRVco0DxgxIaeuAQP
         PXs1mJVMvy5GM//3+dTAVUzmRFA9t8d7wzJMti2bimg/t9vE/1k08y7Ygw0inGaWCXr7
         0lGemPg+mvYmteMQz5x6F2NNcQkaQB9IXypGEhbVm63+iCuPZMtjFM0WsfLGD4qAq1eM
         jIkIPY6U8+xHogU/badLYmJ+sWZ/qD0ysBhrtqv6K99vX8o1g//ZQ1ND8m+QAoulT7FK
         YR7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XDPk6xw+mW+ICS9zBRfnJ1hcJqJGLgpdBuPOzpKOvuw=;
        b=HYBuD0NAVtg7ryZc4iWbffN8yZ6DOdmvSwjmNrQZUhE+cBZ886xbukm7cqsP/CHkmh
         mF7ltTurWxxxLfacJKFEZo2u5uTzHs3VvBkWqBjQm9C0X1ObRY8uBdHZYH8AXkADCxwL
         k4t7gDnWTsSgwapqMdp29md6eYlFnDrdhUvb/wp7l1JxT7YDB84MeJTwUTRJdu5VdmQa
         LSIarFcVvDLg9D454DCF/nRsSDDEgVVMl7RnODF3VbwH23kl9rRZMzH1nO3l7ZIwTX/e
         O4bTxdmI2o4axzJD3m7sPT9vGwpaQSXFbbkfTNdbouRfsRerBVoUwsPy/2CU9Q7ZOCBj
         WJHg==
X-Gm-Message-State: AOAM532gloy5bKzKqCL+n3TCipFAltPIUUpj3NjE6tQsqQUhOHApNUB7
	OaIo1gGKEpf3zzdk0BUeDpqRQetMKcM/9A==
X-Google-Smtp-Source: 
 ABdhPJxZL2+9/8S5iSTC8AXt8Ho3DG8BrKr0YGA+y4Ma2Dqi071yhEx+R2gTaBHu8CUp0oHnaaO2pg==
X-Received: by 2002:a0c:e989:0:b0:42c:2e39:ed7a with SMTP id
 z9-20020a0ce989000000b0042c2e39ed7amr5617113qvn.121.1645191187344;
        Fri, 18 Feb 2022 05:33:07 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:4ff4:26b:e73f:9821])
        by smtp.gmail.com with ESMTPSA id
 k205sm559872qke.31.2022.02.18.05.33.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 05:33:07 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: Emekcan Aras <Emekcan.Aras@arm.com>,
	nd@arm.com
Subject: Re: [PATCH honister 0/2] arm-bsp/security: replace mbedcrypto with
 mbedtls
Date: Fri, 18 Feb 2022 08:32:16 -0500
Message-Id: <164519113713.2418873.18376103860972635548.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220217154531.2562606-1-emekcan.aras@arm.com>
References: <20220217154531.2562606-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 18 Feb 2022 13:33:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3023

On Thu, 17 Feb 2022 15:45:29 +0000, emekcan.aras@arm.com wrote:
> This commit replaces mbedcrpyto with mbedtls on the trusted-service recipe.
> 
> Signed-off-by: Vishnu Banavath vishnu.banavath@arm.com
> 
> Vishnu Banavath (2):
>   arm-bsp/security: replace mbedcrypto with mbedtls
>   arm-bsp/tf-m: update git SHA
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/security: replace mbedcrypto with mbedtls
      commit: 68db42ec651ff33301a89361c0cc2219d919297a
[2/2] arm-bsp/tf-m: update git SHA
      commit: 8a6b6eb8109ed4567353f2318f172261246718c1

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

