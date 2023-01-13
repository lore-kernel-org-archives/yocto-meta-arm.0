Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20233C677F1
	for <webhook@archiver.kernel.org>; Fri, 13 Jan 2023 18:05:47 +0000 (UTC)
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
 by mx.groups.io with SMTP id smtpd.web11.95587.1673633140223454361
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 13 Jan 2023 10:05:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112 header.b=zx+vlkxL;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.128.171, mailfrom: jdmason@kudzu.us)
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-4d59d518505so126769357b3.1
        for <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 10:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lev0Uzl2NB7E1zKkmfg7ofns5O41TRft58FfmsFp6jQ=;
        b=zx+vlkxLxku4bEVKEhpqai2eUwnDeVc+Huw5QyB5DHhmAv2RQYbLxjVzZXnyA+rhIw
         uL8kIVZTOYc2429YAfXBRJsVi8CLOoXVovs6psRC9zilESl0PDr1xuXYb1roMS3FidAE
         Utbi1olE+kL8y6X69r78un9HVJrfifz/2C14oTNg1V5+T9tERxr6rp74HuBO3WCBFr5u
         73hdHmUBLHDQznF2e1pyOOFlUi7hsxnClgNdezRZARTFl8reZ64GRqSWCedy56XsBLFC
         aKI3WqUsx+TVM8/VbDfDwlwhdtuayoZlxnd7RgSrMgdg+MSYQ6G4RxYBs/rKNfeISQgE
         VsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lev0Uzl2NB7E1zKkmfg7ofns5O41TRft58FfmsFp6jQ=;
        b=ju7KRN5lCHGqk3udscM5HqmXZEVKI3ilhQzeY4dlby/WeCFWcgVXh3aoP+DbMvxBEb
         /2t6x8pqHfdObR6jOUyeSq9Auz0fN8CThUcljnbEBCtHjhQb0YtCARZ6vWbQtWTOFvu3
         SahSgC+g47PGGN/9EE+yQVGxulSHWbuPbEGTrPhA6WeiPeZZc4aLx5+GbTX3TOZI1sKQ
         uK+NIMuTkZNlmdh3PDxLD7qXfGaEeM+jx3DTVIBu47iFdymgo3m3foW5e5maGYc7g4q0
         IfHXa+nYWS7Ljkq/XMTUWs7kUYAbQgiQq5hxypdq402tGIvZuW7msqcNsf6FTlFltB9I
         ILKA==
X-Gm-Message-State: AFqh2komQz1SHajn8OjZ8DqAJ5m0YjoipJ35jjJJA8qQBnjCRXIxRXpx
	mcqgg/+2fRS19BIENNzKZGEWn7oIRys48k3K
X-Google-Smtp-Source: AMrXdXt8xXUWsvx6bas8QgbHl+etDMPxfRE66/PyrJx1LD0jfirDyiheDqnaDGOx7lJAXpqvqA14GQ==
X-Received: by 2002:a05:7500:3ec1:b0:f1:847f:8ba7 with SMTP id lj1-20020a0575003ec100b000f1847f8ba7mr965371gab.5.1673633138887;
        Fri, 13 Jan 2023 10:05:38 -0800 (PST)
Received: from localhost ([2605:a601:a615:a000::59])
        by smtp.gmail.com with ESMTPSA id p16-20020a05620a057000b006fafaac72a6sm12764331qkp.84.2023.01.13.10.05.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 10:05:38 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"adam.johnston@arm.com" <adam.johnston@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm/trusted-services: Fix 'no such file' when building libts
Date: Fri, 13 Jan 2023 13:05:28 -0500
Message-Id: <167363312981.997446.6323318982898210793.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221216175508.3149543-1-adam.johnston@arm.com>
References: <20221216175508.3149543-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 13 Jan 2023 18:05:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4281

On Fri, 16 Dec 2022 17:55:07 +0000, adam.johnston@arm.com wrote:
> The libts recipe assumes generated cmake file will be suffixed with
> '-noconfig'. This is only true when building with the default type
> i.e. "".
> 
> Check which target cmake file has been generated before trying to
> patch it. This fixes 'no such file' error when building with an
> explicit type (Debug, Release, etc).
> 
> [...]

Applied, thanks!

[1/1] arm/trusted-services: Fix 'no such file' when building libts
      commit: 13c7463c9fe948ec62e3b7824a7d5a882124f500

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

