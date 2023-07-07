Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E1C8EB64DA
	for <webhook@archiver.kernel.org>; Fri,  7 Jul 2023 04:01:07 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
 by mx.groups.io with SMTP id smtpd.web10.5552.1688702463400510808
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 06 Jul 2023 21:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=xLqYJSS8;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.48, mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-636274ce31eso9819506d6.1
        for <meta-arm@lists.yoctoproject.org>; Thu, 06 Jul 2023 21:01:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1688702462; x=1691294462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FDiR6BGb6P9NOBpX+7HHgR5syXYDhExJPTQAqphW6k=;
        b=xLqYJSS89O1Wr2AuLcbEBXTp3Wg9f6jCS9bz2S51eL1pGukxLOAkseORKEYvnLZq7E
         vVaG4ih0Bv63a0on86iCwDlppQ2qZzwrAPSOhM8ERxRczO6nIEsXQmoKvTILT2mEw3ze
         nPKM7BPo/MwiCTP9do1AFtSnYGKxo093tJUuOJxGpDLcTziQM08dO0xB1B+OTMuRJXY9
         Z5Nvz8XdyH65VJI3q/OAh4FogM6c9j3ST80USZAFWEKd0W/kI/HZSUMYNv/tUoOVIS7g
         f1BJXEdQSwLgO8ukr8DTfNe7vUT6r4aYSNIaLk2HrBLOHdqr5wHMHvl6H7iRzeI8otss
         rdoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688702462; x=1691294462;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0FDiR6BGb6P9NOBpX+7HHgR5syXYDhExJPTQAqphW6k=;
        b=Gc9UEnzsYjJbNisF5BIfGNGZaBPXH90W6H6FWw0T1iAbR8USu1KwLr3S3xmsRtTNBC
         QbRbwHN9t4Xax7IvRK87Y7pHOcDHrobNVRFq2LJBI8eJNXOTdpq3cWgaFepEtbiAA/aa
         vcn2yWZq8IhKQj2c76e7RTqsDtjew5dfbJ2dkoPgG1A4QCDelp43A/fd8DUDqVFQS9Jl
         BhqMGHnn1CJV7sQVP1oNa9u8GLspsA8xn4niwWzbK9xn144WWU3RTDbNEH4BoRgAtupC
         m7De0JeplGHNbgb1Lf1ldUQQNmWWpP64IV/AJVhqTakK6M/6dfQqPMdeWiql1ZKe3/43
         YCew==
X-Gm-Message-State: ABy/qLYBwbAlIz1gW5E0COa9b0LA8vVwXobPVaalT7jbW2YrcruF+aLu
	wJmKzAQLFPBY4nYk1lOgw/ASL+TngZgN74vIAiU=
X-Google-Smtp-Source: APBJJlEUGIRKy3SxzL7nrI55TYhsRR9tajmNyXqw24xY/BfnA5j66cwT2n+Xof1xYh4j2LhyEWKwDQ==
X-Received: by 2002:a0c:dd0a:0:b0:635:d5c5:15d2 with SMTP id u10-20020a0cdd0a000000b00635d5c515d2mr4051342qvk.18.1688702462013;
        Thu, 06 Jul 2023 21:01:02 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id r15-20020a0ccc0f000000b00631f40503cbsm1660946qvk.12.2023.07.06.21.01.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 21:01:01 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	Jon.Mason@arm.com,
	emekcan.aras@arm.com
Cc: nd@arm.com,
	Emekcan Aras <Emekcan.Aras@arm.com>
Subject: Re: [PATCH mickledore 0/2] arm-bsp/documentation: corstone1000: update documentation
Date: Fri,  7 Jul 2023 00:00:48 -0400
Message-Id: <168870244935.375012.9338635684418810297.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230706144217.70023-1-emekcan.aras@arm.com>
References: <20230706144217.70023-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 07 Jul 2023 04:01:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4866


On Thu, 06 Jul 2023 15:42:15 +0100, emekcan.aras@arm.com wrote:
> From: Emekcan Aras <Emekcan.Aras@arm.com>
> 
> Updates corstone1000 documentation and release notes.
> 
> Abdellatif El Khlifi (2):
>   arm-bsp/documentation: corstone1000: update the release note
>   arm-bsp/documentation: corstone1000: update user guide
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/documentation: corstone1000: update the release note
      commit: b9d3c73ce9d24b6d0db19cd8a89a74d9d2234a09
[2/2] arm-bsp/documentation: corstone1000: update user guide
      commit: c683ea2897bce37d9b4eed752760b6ef39ad8146

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

