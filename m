Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9280DCCF9FD
	for <webhook@archiver.kernel.org>; Wed,  6 Sep 2023 01:41:35 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.web11.2107.1693964493926914498
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 05 Sep 2023 18:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20230601.gappssmtp.com header.s=20230601 header.b=vvtiI5UF;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.169, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-76f066e4fffso192975785a.2
        for <meta-arm@lists.yoctoproject.org>; Tue, 05 Sep 2023 18:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20230601.gappssmtp.com; s=20230601; t=1693964492; x=1694569292; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6xvcptb6UkhuLAvYPJ9Nnun+i9htBW4n61YxKGnIpZM=;
        b=vvtiI5UFGfzMJ2isT6wzkdlstScdDUxGjGbc38MjmZiY5uhCvCHuyHKn+ZjofAzJNw
         4EPeHBWOp+qzirCoNiR6jPJnTAe0HZTcH9xW/yo0E69zNsWoHixwyykc9K53V0oolgFp
         rTWw5NqCUrR1TbCTm1hL9y0OpwysIpr+JPaWtnUHyJdwwKkipwCi4PrF55g5etOdDnwl
         0B/0tx+7Ia4wmL0J8uQeYXzirAhM+4Ntp3g/K/oc0qQF867+i0n7dJx36JpMRxz44HIV
         yQF/Nrx4SKoDRlTne68GHSRsjsB1SWHiqZMFv9N8bAlzsrl3Tt/pHEICh9fYSCo2ZMyx
         hQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693964492; x=1694569292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6xvcptb6UkhuLAvYPJ9Nnun+i9htBW4n61YxKGnIpZM=;
        b=ia03j+sZi/Fb21lZDbOELMdNDLPkes8rWhiTld6O+WssAzER4tVxj+CIPmXzPKWYJe
         JiTGZPm3AQMUMjdcL4R4UWKY+C9PCQcUQ4LxCCT/z4fvT+SY6/c8e/jRALhDTx6DE0fs
         cUHhUvAhgEM3vnjKMnoqBo8NJUwxSz9ZTP2o32y08rv3QE30aWuKGopvDpWd0d44lE0L
         kvfq+/PQg6x0Tk404mp3D7HpTE7brp4Kzk8KZjS3dLvY5J2LoOQa8l0LCfuv4WT78fwS
         yXbQxJXQ2hQYvH7vbLwImO/qHioMZ/xZniSSBRjR9pwmkz0sVeaixDCe3jG6l+Di4Scv
         o9jA==
X-Gm-Message-State: AOJu0YwV3QkYwWxC5fjLk3D+op2DUzDWRNYDCZSEiuMux6AxAhmTevwz
	2xWqLaQC90LQjfawmpHCNUUDM5I9bkK6JCm94sk=
X-Google-Smtp-Source: AGHT+IFgYL+CijDPqURxNsxkVsp1RXmv2dBjozVkuW3IdnmHVtKpRDpp17/yhGaav/+Javmxe8nDPg==
X-Received: by 2002:a05:620a:4112:b0:767:3e13:6017 with SMTP id j18-20020a05620a411200b007673e136017mr18918479qko.30.1693964492512;
        Tue, 05 Sep 2023 18:41:32 -0700 (PDT)
Received: from localhost ([2605:a601:a697:5800:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id a6-20020a05620a124600b0076f16a00693sm4532933qkl.47.2023.09.05.18.41.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 18:41:31 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	anusmita.duttamazumder@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] CI: Build custom image for N1SDP optee-xtest
Date: Tue,  5 Sep 2023 21:41:18 -0400
Message-Id: <169396448142.362418.5840302173619959975.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230901163626.152-1-anusmita.duttamazumder@arm.com>
References: <20230901163626.152-1-anusmita.duttamazumder@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 06 Sep 2023 01:41:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/5020


On Fri, 01 Sep 2023 17:36:24 +0100, anusmita.duttamazumder@arm.com wrote:
> From: Anusmita Dutta Mazumder <anusmita.duttamazumder@arm.com>
> 
> Build a custom N1SDP image with only optee-xtests as part of the image.
> A fresh custom image build is necessary to include the relevant test
> suite for running the xtests.
> 
> Anusmita Dutta Mazumder (2):
>   arm-bsp/n1sdp: Enable tests with pseudo trusted application
>   CI: Build custom image for N1SDP optee-xtest
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/n1sdp: Enable tests with pseudo trusted application
      commit: 6ecdc3bc8bb0aa74390591eabeab14d771c258f5
[2/2] CI: Build custom image for N1SDP optee-xtest
      commit: 302cdd0a026bdf09c2508f24c4ec93427c375d87

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

