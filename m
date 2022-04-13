Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83FE7C47089
	for <webhook@archiver.kernel.org>; Thu, 14 Apr 2022 16:03:53 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web08.3712.1649881824318224780
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 13:30:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=HPPBqvIA;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id x20so2489894qvl.10
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 13 Apr 2022 13:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=EGMEowaLe7skG0ctFgyOA2DmX7kg7WNxABA7mA4qiIY=;
        b=HPPBqvIA0LP34jjHvQ94uR4/ly8+bXSkQqVkydKqLvaNH+uoXDumla0akizGtgWYjN
         JDDSh82L0RDhRBpH5E4rqn++2j3Q8Tq2msc9+PYFgQnuhG5O+9BQSMG4vhhfmMf4cY9z
         rJkkTarqI80ZskTODvZ94qOmhFNOIpzw47CLTI3i+V9N2JJzYjMEoVBfPNq4OrQzKU8n
         oDOUq7eEIIgh6xNRnMTNsDp888sAOl9KUGTdzApwVfHPx9EIGef7/kjLvuZUuBCJWp5D
         Nab6hoOsmiGuzBt+2VaWHtnKtOdr1Yyh8KTX29TRM8rZjS6+2YDAlgIRyS5FolXAI9O7
         WXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EGMEowaLe7skG0ctFgyOA2DmX7kg7WNxABA7mA4qiIY=;
        b=dO1n/3WPb3Vp5fifIvRalrJlgpn9tuqlEKCiB4Bdc4FhUG2zZTUiXZ12i97G7hx3C3
         M7HvXFwK8IGh2Y8pmfc/I5/eLodxaRwTG/AUTL+TanDkJt503Om1y0w7OdwfFMqAr6vM
         17uqae8B6K8UZrwUj1g2vnbCUALzGLGWFE8kcNSk9z3zO31dq7AcXaIxbAC07zi0ttW5
         lFnUSzy9lUwCSEEhkg5jbqSiM/vtnRx166F2NHihAosYlI5ZwYpnvgxSor3KkTvmiehe
         eKAm/UdE03BkYgdVph7vwzICUCXMNzIjkIX0M5pIewxoEgqEOmZFpQ0JtwWsaqpDfqBy
         VIPw==
X-Gm-Message-State: AOAM533QnWNELQac4oBpa25MjocpSLMkvSlWLvbcnkkRXHPH49RUlMBs
	1zHP9/EZ8Z6dB5RMwjFnGZIBeAnJ2s48zg==
X-Google-Smtp-Source: 
 ABdhPJyRvUHXdETXWAD9hX5Kw9H0oerni3Vql0eknO3AlLnlN0HJ/14E+wXNC5fyevythRFUdO3jpA==
X-Received: by 2002:a05:6214:258d:b0:444:684f:d780 with SMTP id
 fq13-20020a056214258d00b00444684fd780mr455377qvb.49.1649881823353;
        Wed, 13 Apr 2022 13:30:23 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 e15-20020ac84e4f000000b002f02b21f1b7sm5601040qtw.57.2022.04.13.13.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:30:22 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ralph Siemsen <ralph.siemsen@linaro.org>
Subject: Re: [PATCH] arm-toolchain: ignore CVE-2019-15847 CVE-2021-37322
Date: Wed, 13 Apr 2022 16:30:18 -0400
Message-Id: <164988181833.257738.12473977357402082112.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220408171711.2274694-1-ralph.siemsen@linaro.org>
References: <20220408171711.2274694-1-ralph.siemsen@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 14 Apr 2022 16:03:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3270

On Fri, 8 Apr 2022 13:17:11 -0400, Ralph Siemsen wrote:
> CVE-2019-15847 is a bug in gcc POWER9 back-end, which is not relevant
> for ARM architecture. (It has been fixed in gcc 8.4, 9.3, and 10.1).
> 
> CVE-2021-37322 is a bug in c++filt, which is part of binutils rather
> than gcc. The issue was fixed in binutils 2.32 (poky has 2.34).
> 
> These exclusions are needed only in the dunfell branch, as it is the
> only one with affected gcc versions. Master branch has gcc 11.2,
> hardknott has 10.2, and honister has 10.3.

Applied, thanks!

[1/1] arm-toolchain: ignore CVE-2019-15847 CVE-2021-37322
      commit: 5c09684863be8e803e3e987a5ce4940721c3f39a

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

