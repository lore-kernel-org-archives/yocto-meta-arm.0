Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22C7FC77B7A
	for <webhook@archiver.kernel.org>; Thu,  8 Jun 2023 02:11:56 +0000 (UTC)
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.web10.126.1686190309465018432
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 07 Jun 2023 19:11:49 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=p2xzWj4l;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.52, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-62b65e4c42eso1126086d6.3
        for <meta-arm@lists.yoctoproject.org>; Wed, 07 Jun 2023 19:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1686190308; x=1688782308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KU6iVzuUQV8RQAYYd5B9wWuGmly1EF8d2D+u8O36Xwg=;
        b=p2xzWj4lN2yjgrB8ga2blLInDpDuj82iEtPnazq3QkzVKHXzno9PsiL0pWd9txtZud
         rshJEeDpwN3P/jM+4I8a3PfCq86dUsF2FlBcDhX92uBO/XJp998Q9CRPeoTpv8ZuZUIe
         Y9lyQJ4WnSOp0Q9nsDsACqrJeBP1pIIhTMXPFQE0uy6qljAtLeIJBHqImvTAqX1jiSTP
         eXLUo0Fwp2uT86YZcHkK1uzmlqFu62C0X7b/Ewy2YLhpboqwcLu+X/eFoA5hSd7K3HuN
         1JedIMW7kUI8nKUHr46YfmaqBfYaQSYLUkryK1plxuWW3Lsc/e+WyxDoyPxnR0rTf2Br
         aVBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686190308; x=1688782308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KU6iVzuUQV8RQAYYd5B9wWuGmly1EF8d2D+u8O36Xwg=;
        b=C+2HDp3ExYNFwRoHOJf6w2ooZjW65nH6x08jWOKcWYjKNxPE/8l3tNnxqlDJ3RgXPA
         XjQTgeeQOw+41FBI8rVqSOjQ4czH+VThGbp+0sOiUAo4d6xtr+4sjd+GtJvJyPgA2VJo
         /EY6zaXT2l3QS3rgqzguEcvRCspRNRDs7WBGGIOWnnZ84Lv4nMncNS/FZDQbe320kvfo
         SeVoajRn+8gxsAlHmcJTD93k1amrs7Ahrl/m5Auuq9UkD/4soKXwucOA/GFidjzwYZp+
         OcwIvHZyl+P+P3CgFjYgQ1gS5TGZVK25V5EgVyvZK3yE9FJl82UHb9ah4WT+RWWoV19/
         Cuiw==
X-Gm-Message-State: AC+VfDxnrcKPqtEyWfgUUjOpxKOp5UhDxtRjIe7k2B8h5JJyHEfuQLf6
	xgZsuTXpbzU5cz5MeksjrKEm1ij0SKtew2P3BHo=
X-Google-Smtp-Source: ACHHUZ5QsGynbzvch0mSA2xhdacjfFu/dsa94yrWRj3sxOi1Jbze3np/a+Lc3EDBoaKENmJ+Xj4E1g==
X-Received: by 2002:a05:620a:6406:b0:75b:23a1:8e46 with SMTP id pz6-20020a05620a640600b0075b23a18e46mr3934441qkn.23.1686190308112;
        Wed, 07 Jun 2023 19:11:48 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id q4-20020a05620a038400b0074ced3e0004sm24353qkm.63.2023.06.07.19.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jun 2023 19:11:47 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH mickledore 0/1] arm-bsp/u-boot: corstone1000: enable PSCI reset
Date: Wed,  7 Jun 2023 15:33:14 -0400
Message-Id: <168616639801.3869142.15847635645775598357.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230606144301.52773-1-emekcan.aras@arm.com>
References: <20230606144301.52773-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 08 Jun 2023 02:11:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4746

On Tue, 6 Jun 2023 15:43:00 +0100, emekcan.aras@arm.com wrote:
> Even though corstone1000 platform does not support the entire PSCI APIs, it
> relys on PSCI reset interface for system reset. The name of this config
> changed in the new version of u-boot. This enables PSCI reset, so
> the system can be resetted in u-boot again.
> 
> Signed-off-by: Emekcan Aras <emekcan.aras@arm.com>
> Emekcan Aras (1):
>   arm-bsp/u-boot: corstone1000: enable PSCI reset
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/u-boot: corstone1000: enable PSCI reset
      commit: 8afdb9a895f689b8012e75538856d83484e0cdc8

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

