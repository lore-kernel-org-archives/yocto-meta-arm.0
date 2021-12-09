Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BF7C433F5
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 17:06:43 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com
 [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web10.14401.1639069602792037560
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 09:06:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=1vn/OmMG;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.181,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f181.google.com with SMTP id f20so5925942qtb.4
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 09:06:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p7TRI+BmxFqW0XU/qNgvI49k+KCtLdM401YC9XjG3fE=;
        b=1vn/OmMGqhiRk7+KA/AYRsxDEQd+//5ir4v9xRL/VrWm4mPD00pRIopQ6QkoNZhTp0
         74KxS+GKnZl5ZxjT1Z6kUuPBpjHXszjy/iy7UlqvB61JBSl0eaNj0GjfJng/P+xDnjJ7
         AxWdiWNeaHaYIoJv+b2xwFckDRJ3VZwWhzxYEP3kiOUiTlx7f3VCloJjFqkVAmUeGcTb
         d1ObQgCmaKzKaIrL7EC6qIO/l3XpnjikctA7UESSc9MTZU3e3K9LdCL0aoRVHf+4IiXt
         FJCik5l6syZTubHlBecJjyLfo71zkSAJDWbLPWWeptO524eFFfxktqaLav3F0sRKSeHC
         z/eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p7TRI+BmxFqW0XU/qNgvI49k+KCtLdM401YC9XjG3fE=;
        b=XhmNCXTze+1QbCUDA5RyBtgjGK2UqfuSQ72TW7pRw/ralUn3g67dzjU9BoSqT8lytO
         xCajCYxAjLviLfI5BxR97Q1jFnZU7VQyWnAauGJYR73g1pouTKul00xy6fhP0EN1bZ50
         B8xar+fRmSxCEkC7TKbC6rJYqY46lyV0z+8HwioNaGpnoq+FsKQMmeNU+/SnWD2RaWX9
         xj8cLp812R9/vOp5xdmuW/+hOljTqV6nwRBqMMem4SP8nrzcKJB8DApxXoxDO1Yob4bu
         xOIeVDgqUrtlYpXZS4tKXmFhr3qrifHtLeAkNc3B9PdDpE2NNpawNm1P+pgfX1OyKxoU
         nyWg==
X-Gm-Message-State: AOAM533HxIawLb+/v4YnQ45bIJpoIfFP6/RDjCGaTNa1utWGd9vFWSse
	s4+ecvQmcBWouzakgOToIlD12UpOJPubRg==
X-Google-Smtp-Source: 
 ABdhPJxlyc8bF+BHkXW5Bomm8WCkCRaGXhC04ANCMFoWHGTF3/ajz9oj2SCHRsG2CEOeyuBjq7YaQw==
X-Received: by 2002:ac8:5a91:: with SMTP id c17mr20752724qtc.73.1639069601754;
        Thu, 09 Dec 2021 09:06:41 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:28c4:a17f:5953:8cab])
        by smtp.gmail.com with ESMTPSA id v21sm313017qta.0.2021.12.09.09.06.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:06:41 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Hugo L'Hostis <hugo.lhostis@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH] kas: Update include syntax to kas 2.6
Date: Thu,  9 Dec 2021 12:06:33 -0500
Message-Id: <163906959603.25051.15402497173104489067.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211209093455.8774-1-hugo.lhostis@arm.com>
References: <20211209093455.8774-1-hugo.lhostis@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 17:06:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2583

On Thu, 9 Dec 2021 09:34:55 +0000, Hugo L'Hostis wrote:
> Using a path relative to a kas yaml file to include another kas yaml
> file won't be supported in the future. This patch also updates the
> documentation for fvp-baser to set the minimal supported version of kas
> to 2.6.
> 
> 

Applied, thanks!

[1/1] kas: Update include syntax to kas 2.6
      commit: 3c2f7c3d0504ed7066d1f9f68f45fbd88a880403

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

