Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DCADAC77B61
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 21:19:53 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.64665.1682371184159994952
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Apr 2023 14:19:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=Xg1+KXyx;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.51, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-5ef4d902708so49677756d6.2
        for <meta-arm@lists.yoctoproject.org>; Mon, 24 Apr 2023 14:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1682371183; x=1684963183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yq1rv/PTc++knyal+GzVQhDTlohkY3TaxEZdJDohP6o=;
        b=Xg1+KXyxmmGRsm779xvl49Lr5bGnio8l190y9qegaW2eDhSvAbpNdsToH/MgVmaGjx
         PjteMZysPxmLbEB7KmmO5ND1uxU5QePuLgnS1ZwcJelZP39Zd3kZEF4jZSThbmEY3j9f
         EdtmKCC/QEuPQzgQQlBEcfPrVLCUm8n+w9ZcDNuzSsM1UTW28a/ODWOAwCXOr9xGRo+9
         nEj9UYct0MmQp6zDwI23bC+oeJKO9YjUct8cRsgeWOZlE6yJholQVMZTvOQSkn6QlrUH
         S/798QDOxvM2opci73ymvkzjil/Oo/KrWlePVbkPZjbUMlV568chUa2YtbR13aiRIoSq
         YRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682371183; x=1684963183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yq1rv/PTc++knyal+GzVQhDTlohkY3TaxEZdJDohP6o=;
        b=lD02DQbqNmvK2ChVm5VjFQS/nwCFtwx6CBhn/sWmsbUe4y+gwJztn+OKxImX2o/yc+
         wQzs0YWgCOitygE+UP3FECabW6hHopajcMI/G5vPPlv3woX9mnIw5zlSIxHo0Se5BwP5
         N3oFYJ2uUWUC1bG2kMV/76nl4jDyUvZ1HjTMfwfquSzThozQnrfjVH8912fYCWheR/9f
         /ceKAFc/+wZ5cRDyb7YgnWFA3hhc9hkSPw7ykMVJa7x1PpjJTRZdKu+dFtxV2lWFAkwh
         83SpzTce6U8G0UCL7yim1ZH8/vh5IautpOGfhyNJY11fhrHjU2/ew2SkyxAoa8pLlfG9
         QD5g==
X-Gm-Message-State: AAQBX9fpA0YI6fy5DkoWe3FcXW42Qz1V7odFWwyCmstqYQRARTEC3Oti
	OkfmEqGLuV7pwAAyW0DaW+JSknbbi7qnWAE5aR4=
X-Google-Smtp-Source: AKy350Z030e7u7Dh2aIE+E9F1r6tL+3UtYeSHrmrYvf6PM6xtVn1EZcoWyKxWAucBAfy3worpZHi0g==
X-Received: by 2002:a05:6214:402:b0:5ef:6eb6:e26e with SMTP id z2-20020a056214040200b005ef6eb6e26emr33047288qvx.6.1682371182777;
        Mon, 24 Apr 2023 14:19:42 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id r18-20020ac85c92000000b003f0a7c13fcdsm506989qta.74.2023.04.24.14.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Apr 2023 14:19:42 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/trusted-firmware-m: Increase assets number for corstone1000
Date: Mon, 24 Apr 2023 17:19:23 -0400
Message-Id: <168237116540.1521195.4570778239432567262.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230424153859.18557-1-emekcan.aras@arm.com>
References: <20230424153859.18557-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Apr 2023 21:19:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4615

On Mon, 24 Apr 2023 16:38:58 +0100, emekcan.aras@arm.com wrote:
> Enabling new features on tfm for corstone1000 increases the number of
> ITS and PS assets needed. This patch increases the number of PS and ITS
> assets and fixes regression on psa-ps-api-tests.
> 
> Emekcan Aras (1):
>   arm-bsp/trusted-firmware-m: Increase assets number for corstone1000
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/trusted-firmware-m: Increase assets number for corstone1000
      commit: 95e535b0a14dcd3038821fad0ec2ae79849f97d9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

