Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBC4BC433FE
	for <webhook@archiver.kernel.org>; Wed, 18 May 2022 20:30:42 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com
 [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web10.1598.1652905836049120638
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 13:30:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=wrroKZT+;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.41,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f41.google.com with SMTP id l1so2505962qvh.1
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 18 May 2022 13:30:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rFpFlJnONzMj2Q+ztX9G4NnII8A49X0IbcrPKAr0BdM=;
        b=wrroKZT+Y7bvLnteXth5bYqlCWoHMsOm6UWK94yoZ6/nEmf6R6D74jrgJoWOUVb2zc
         dXSrmboxxBR3M5G58A30iBud2bOpnunb5hSvXnZP0hP83glIC8CoANhGNBfBV1JLITq5
         P2tuR7KHGUH0TeM/XtTHC9Zz89n76uOc9RhJjXj/fvnNKGKIN7D/FEGx+pUNbR55Pm2h
         fo7oGKicjKEZ6J6mYCAg3QtnsR9UuBzEaQU/KGboAxNO7RJShSYdEPjizhfx4pTU09eS
         og5b68RYKukuzdkE9NJR8okyfacrUrsjf9VJKz5+tMi79NhvgZaIDMcQq1K8hm2m4Ozk
         ILcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rFpFlJnONzMj2Q+ztX9G4NnII8A49X0IbcrPKAr0BdM=;
        b=IoSbQQ60zC7MiZe7QR6gmssEntousOG5oPcyeAQlGnpJ8dQ44rZvFpEcnz6x1efhXD
         8s82W+lgnt1djUQ9/qk7YBFQ3rwRVgaoKQxUm3l1pY1K2XnvgKJ77rBGIuGV7zRiQZVF
         0Y0VlHdokkBw6ZmAlmG6X0yLzDV8UMfgLoxUzZs9f6BvAsxq7hMiHmMofHAwT1engm7c
         vBZmAxrPx2NdBbhWHkJxnwhDlo5zj9xr+3T3/r4QfNQEJLvpXaGnMAqcyGtYTz1Hw5Nj
         ljBBmEYhWW3YIjp9M4qRQzEvwTR0/ERF8Qig4hytS0QAu0PTK38va7HgdGrGNVZQc32S
         5LkQ==
X-Gm-Message-State: AOAM530CB+ovTLWzJuvTf4ylSxv6bKHoFwCPNl73RExRsR7YZJEBANkM
	TvDG4UXBCYSyoYqLExQub5kIBhejhHwOxesL
X-Google-Smtp-Source: 
 ABdhPJx5Fq7DCLwrleDJIoOCNP3Kv7DFPkzFFwXyhvQpLZPrAOTBHrycnFNX42zVVPhscRUfn99OJw==
X-Received: by 2002:ad4:5fce:0:b0:461:f39b:e0b9 with SMTP id
 jq14-20020ad45fce000000b00461f39be0b9mr1453527qvb.129.1652905835090;
        Wed, 18 May 2022 13:30:35 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600:5336:1ccc:fa87:21b2])
        by smtp.gmail.com with ESMTPSA id
 n3-20020a37bd03000000b0069fc13ce1fbsm139907qkf.44.2022.05.18.13.30.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 13:30:34 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Cc: sumit.garg@linaro.org
Subject: Re: [PATCH 1/3] CI: remove preferred version from external-gccarm
Date: Wed, 18 May 2022 16:30:18 -0400
Message-Id: <165290581936.1529216.7783724691009319476.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220518112051.3470898-1-ross.burton@arm.com>
References: <20220518112051.3470898-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 18 May 2022 20:30:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3445

On Wed, 18 May 2022 12:20:49 +0100, Ross Burton wrote:
> I misunderstood how the external-arm-toolchain recipes were working, the
> latest revision of the recipe works with both 10.3 and 11.2.
> 
> Clean up my mess by dropping the PREFERRED_VERSION from the CI, and revert
> the addition of versioned recipes.  Simply using the right tarball is
> sufficient.
> 
> [...]

Applied, thanks!

[1/3] CI: remove preferred version from external-gccarm
      commit: 047d2b391cf88cd9969860d26ac459e01a69822c
[2/3] Revert "arm-toolchain/external-arm-toolchain: add back 10.3"
      commit: 16fe716dc60ddcd9885e8b68a3661dfe94ed35d9
[3/3] Revert "arm-toolchain/external-arm-toolchain: set the version in the recipe"
      commit: a52f85a2af9d40874bd6a511665830eda76641bf

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

