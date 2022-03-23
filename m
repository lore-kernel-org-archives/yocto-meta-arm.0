Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC584C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 13:32:17 +0000 (UTC)
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 by mx.groups.io with SMTP id smtpd.web10.9235.1648042337353911758
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:32:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=fWdbZ73P;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.179,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f179.google.com with SMTP id b189so989839qkf.11
        for <meta-arm@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 06:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OXusi+kSUBt3PPoLxG7dnSeliXuGQ/OcKHJksCsDzHg=;
        b=fWdbZ73PiybsZ9CGGEoE2Dscxaww43S3mFnmKjMrisnunIsksf6EwXQCeztNkp1qen
         mFecercjSdcJ7WZC+lKsGWZ36ynCeWRd3todFEDAgi9ZnJi45L/10GJcNdQ+fOVDBptx
         ukipoMUvFLJXTEd/laN7ebciOHRxcKFQRn5aMCbLC2Zsi3BMLdhkvgTm2vNRdXcIt+4m
         mdXIkTaTF95R4QSATc2m94NeTddLkM3dhuEDOngB7yuA/EiqkSAvbLf7eOXMvSACNbd9
         5lo7KYdcKJwpJMhTCr7tZxkD6sCfSfCXvb3962Bn1VWSBxi0h2LI8HNLkq7c67kpYuIN
         DCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OXusi+kSUBt3PPoLxG7dnSeliXuGQ/OcKHJksCsDzHg=;
        b=P8TUrv9E11njq7HglYjihY69Dmna1pm7J6UfTRjPBZ6RQHbBgRPQqpLwFiOCIGfS5n
         wVrWqoeCxQURS5OHUSB/LPZkehRa0UES3c0HyaXWGLkUk9QagXUZ0/9o5BIYNickegs4
         6Tiwr66xrVUfj/Ps2kY9hem9fsNOW41vZWg/dFLcinfvvndvYJPtVZRNuA6ZAchtxzrD
         8iB1OH5YLSoD57KeFaXnAeQNDoyCdtCz+PkERr+H5gOehT6kCj13+wf7hDde+DkLQBQ5
         aKQYT4c6AMPEAmOWlXViwjmTV/a/O9/DNIR7IAct7GFDc69rCxWbZ4+c5YwvKTcWhFad
         xV2w==
X-Gm-Message-State: AOAM531lkM8GFKcoW+1yg18E9E+GJaIh5C6G6fA2JEYUrNRVWzZLLkVB
	NPrvsNAc3dQH730bEy4lsJ6nO/kPvMTpqQ==
X-Google-Smtp-Source: 
 ABdhPJxRqL5r0U6o2PoP0OnM17ZZUUmka86RN4yOpJB2jLNUAKIct5Fi6hwnMJYqzn2Faa7WPKBPqg==
X-Received: by 2002:a05:620a:410d:b0:67d:7391:de64 with SMTP id
 j13-20020a05620a410d00b0067d7391de64mr18345383qko.78.1648042336342;
        Wed, 23 Mar 2022 06:32:16 -0700 (PDT)
Received: from localhost ([2605:a601:a66c:b900:3b2f:a3a7:b707:646])
        by smtp.gmail.com with ESMTPSA id
 m3-20020a05622a118300b002e1beed4908sm53788qtk.3.2022.03.23.06.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Mar 2022 06:32:16 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	ross.burton@arm.com,
	"emekcan.aras@arm.com" <emekcan.aras@arm.com>
Cc: Emekcan Aras <Emekcan.Aras@arm.com>,
	nd@arm.com
Subject: Re: [PATCH 0/1] *** meta-arm/classes: Create wic_nopt class ***
Date: Wed, 23 Mar 2022 09:31:19 -0400
Message-Id: <164804228334.3978431.3013960990516482387.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220315155221.530910-1-emekcan.aras@arm.com>
References: <20220315155221.530910-1-emekcan.aras@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 23 Mar 2022 13:32:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3200

On Tue, 15 Mar 2022 15:52:20 +0000, emekcan.aras@arm.com wrote:
> Corstone500 and Corstone1000 use wic_nopt.bbclass. This commit creates
> this class for Corstone500 and Corstone1000 in meta-arm classes to remove
> the need for meta-arm-image repo.
> 
> Signed-off-by: Emekcan Aras emekcan.aras@arm.com
> 
> Emekcan Aras (1):
>   meta-arm/classes: Create wic_nopt class
> 
> [...]

Applied, thanks!

[1/1] meta-arm/classes: Create wic_nopt class
      commit: 956f323a05118f634c9853d0de48145e4effb97c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

