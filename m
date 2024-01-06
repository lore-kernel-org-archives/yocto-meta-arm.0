Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 217D4C3DA6E
	for <webhook@archiver.kernel.org>; Sat,  6 Jan 2024 00:46:20 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web11.39785.1704501972574316373
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 05 Jan 2024 16:46:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=vmcyr6fw;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-680a13af19bso1215486d6.0
        for <meta-arm@lists.yoctoproject.org>; Fri, 05 Jan 2024 16:46:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1704501971; x=1705106771; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgGR8zRqOJ64f7xEKK8UH3dyXccpYJdC5+7v1Le55X4=;
        b=vmcyr6fwTXhLJegkDSopmblzK8wWCpLMir5P00KO1LiyTDaC1M0eJcZG3FpkJE//Kh
         G+9QKaSIOIFaUHg8iHkvHPBlObhl9XGfGvoPFOsqPxohjq3Vi2XaBBUj2JedzKBImxg2
         j13OxKqgf8goNIz5tL71c62MAK+UP85fJkLQrchGjjC0/BrdclRbGt/ccqgi8/+vCdeN
         QF6Azouv0QpXq7PWUpel3GMVHf89shkzetJ9JhPHIye623FTy8ZMvd/cMpEW6iUtGfr8
         dp9pK7kqxN6vGD+P7n6T4DWptUYF/cp0McUWCRIl1hvTz2xBNKmPF4uxAzIJcuurjcab
         1BQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704501971; x=1705106771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgGR8zRqOJ64f7xEKK8UH3dyXccpYJdC5+7v1Le55X4=;
        b=wRf7gxuRmzou0Iymx9IeLcn6Xp9a+yQxrb32WjtKC+jgeUP4DS6nChKkillFWEsGgh
         ygXGt0jBEgliugcBTf1sMWB6MjG2IMm4+6JDlCHngh9FcS1Ma2nJzMTV5zDgK8nBTNXU
         +vUP/3XTdltQfDe2obGqsqxXTwZX5VlARtfgc7/SLEuHdqSIQqiinxYEPYIYOrdCEbTc
         XJrUi1MCKjKIaMChjOMxvIuCSACrryCcNWdThitTyelOuzbMkwEluOr5jlcqmO0a+dLT
         10F6SkOXBGuVQnHwUna1YsVv2IuuAwlmfjpedzuxElKqUcw52YD7+gymIcR6gqZwwmp/
         TT4g==
X-Gm-Message-State: AOJu0Yz6qZ7htxVpxZw9Fy9IJ+kbww1atSLPcxY7+N8kakygOp2yfI/d
	gcp079xKh2Hs0W70eL60K6Ronfom8tjPxlncud+NuqrrfA==
X-Google-Smtp-Source: AGHT+IHUFH+9ko6OeK27ZfO/84DJlYs3OWmB0/6G0+rKjqfUze9/g1Ik8uMnayuLvEr5ql5ciMofmg==
X-Received: by 2002:ad4:5969:0:b0:67f:7faf:87d5 with SMTP id eq9-20020ad45969000000b0067f7faf87d5mr262195qvb.117.1704501971239;
        Fri, 05 Jan 2024 16:46:11 -0800 (PST)
Received: from localhost ([2605:a601:a6b2:2400:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id 18-20020a05620a04d200b00765aa3ffa07sm971261qks.98.2024.01.05.16.46.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jan 2024 16:46:10 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	emekcan.aras@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm-bsp/linux-yocto: corstone1000: bump to v6.6%
Date: Fri,  5 Jan 2024 19:45:57 -0500
Message-Id: <170450196049.2446090.7730051588361595498.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240105162426.811390-1-emekcan.aras@arm.com>
References: <20240105162426.811390-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 06 Jan 2024 00:46:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5314


On Fri, 05 Jan 2024 16:24:25 +0000, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <emekcan.aras@arm.com>
> 
> Upgrade the kernel to v6.6%
> 
> Emekcan Aras (1):
>   arm-bsp/linux-yocto: corstone1000: bump to v6.6%
> 
> [...]

Applied, thanks!

[1/1] arm-bsp/linux-yocto: corstone1000: bump to v6.6%
      commit: 450e42e7c24312d12fb6cb8e0f37eac522dc0207

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

