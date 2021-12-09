Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B770BC433EF
	for <webhook@archiver.kernel.org>; Thu,  9 Dec 2021 17:06:45 +0000 (UTC)
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by mx.groups.io with SMTP id smtpd.web09.14507.1639069604447701526
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 09:06:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=Ikv0F4GI;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.50,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f50.google.com with SMTP id i12so5639381qvh.11
        for <meta-arm@lists.yoctoproject.org>;
 Thu, 09 Dec 2021 09:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=x7bhcU4TfAbGvQON2w64Rekp4WPps3/KLWcZZA6gesA=;
        b=Ikv0F4GICtVjUPfCUJI5xF7TuXk61Yi5T32yiky8ojOd7OCAD/8ayHHPPq6o/mKxjN
         VzH5jaeR06swdymSvm5Iz3l0U/8OFqTM3hD8cgUp/NFXrDZAqmr66WwYulVjv7slvNnB
         F2/gDwa79aL/+zwALS3sZoaS/ZhWNRUXopmqweovzvRwzVILLE6LAAPhpHFijBaiYMFV
         agCDzHaSD6MgRS+DIvSq25s0geleBf+NqZwAWoDM6wvddvkaz92X0/surWy9E9fF45Iw
         XkTAGU9mbux7HKtg466eVnH21xjVaV1QIixMZ7G8VKdUD+1ohR2+X2r9B5p1TruM4BB7
         nALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x7bhcU4TfAbGvQON2w64Rekp4WPps3/KLWcZZA6gesA=;
        b=nRDhxLunoAVB3RGKNJASebDFkJkYguYb+u74QR5/ChRUKxlDxCbUY/YSRAPW4iNc9s
         64gzaV8p07Jc24do1Fisv5gdHx/3kG8T8dBip0HAP9FBLZ1JKcXgdVVJiOojv5GM1Ytl
         P+1GNb008TNd4MIrVL/8X3K3hjpFKllT8FZTpNCQxUXMEPBrn3zpsEQNRE4Lk8HJ08Q4
         Z2JZivLXKHH/IqbNN/z4pFCwGXKXmMCeXWsVmbO0kD++McguWm25cQeDl8y7/zrcB9YV
         VFxh3XAWN4oF/84jQpNe5+h9e8DqQREWJnRKVJNpS9fDcDQWJrvRLx/GF4q+iMPK9YdQ
         4C+Q==
X-Gm-Message-State: AOAM53142Rwaege37c8Pkc6vz1O6mvsdXuMpQZivd6jMZZb1g7CbtwYL
	P/h/2MbIUCU7hvvXAS+hNqzjQRIE8usR+A==
X-Google-Smtp-Source: 
 ABdhPJxFs4BsE0UN3MxTem03t8qUsyoV3ZJfBLZDOx72jug0NDKOMTWrJ3fnshMZY8LY/qmwnhsYHw==
X-Received: by 2002:a0c:eb05:: with SMTP id j5mr17480133qvp.116.1639069603432;
        Thu, 09 Dec 2021 09:06:43 -0800 (PST)
Received: from localhost ([2605:a601:a626:6000:28c4:a17f:5953:8cab])
        by smtp.gmail.com with ESMTPSA id
 d17sm238014qtx.96.2021.12.09.09.06.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:06:43 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Khem Raj <raj.khem@gmail.com>
Subject: Re: [PATCH] trusted-firmware-a: Pin to use gcc for now
Date: Thu,  9 Dec 2021 12:06:35 -0500
Message-Id: <163906959603.25051.2143759503993859033.b4-ty@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211208205809.3079680-1-raj.khem@gmail.com>
References: <20211208205809.3079680-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Thu, 09 Dec 2021 17:06:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2585

On Wed, 8 Dec 2021 12:58:09 -0800, Khem Raj wrote:
> 


Applied, thanks!

[1/1] trusted-firmware-a: Pin to use gcc for now
      commit: ad030e5830803c308a6b035b8ba1f63d42d5dc2c

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

