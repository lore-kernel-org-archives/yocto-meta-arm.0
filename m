Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55136C25B08
	for <webhook@archiver.kernel.org>; Sat, 20 Aug 2022 13:28:47 +0000 (UTC)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com
 [209.85.160.180])
 by mx.groups.io with SMTP id smtpd.web09.6513.1661002112547043339
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 Aug 2022 06:28:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=z9yxWZPz;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.180,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f180.google.com with SMTP id h22so5112009qtu.2
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 20 Aug 2022 06:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=c/LgtQ+HvTMNyDvrcqQMSuDJRmlmZ8mN9JDdVvOXE68=;
        b=z9yxWZPzweB93X7T28oQRWADC/MRUzIJEdQ+y0tzjfD9qyB0LYW5iiigmo7cTyxGQZ
         bqIXGS7U+nR4y6mZGyK3OxBDC9dvAql81X6KCq712/QsKMZp6SmmXPkq4P15+4xAd3d4
         IAl3LafAMleMN9AaZX5j674vvNaZOClqZhZihtBxkSLE5v2VNj8sHpGKTKT2Mh6C1XSO
         jT73n3vxhOXa3S5zTrzVz2OMy7DIxOU6gJOxsHDCZkqpBMI4JRM+j+/wChho9j7y6d/x
         mKS0ZtyvHGB39RJdHStzDsvotziroB/l/+L5tmVx21aFQPn/9JPsp595ogqzNCnLD6GU
         7omQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=c/LgtQ+HvTMNyDvrcqQMSuDJRmlmZ8mN9JDdVvOXE68=;
        b=lugxxZo0WOYHs0bLFwTJlmHcXdApYsj1QjT+2WdnqMWVSwXUcOUIxA+BH3sfZHIwDb
         KLu7/cQdUAsNnrFt/xQ9LfCXLBZzcAoqe0UUxwSYX2aGR+gRpHXEZOLJaqKsQSRdPyEn
         R5AtOAnSFFU4qzh5gF+ffhBWye2NnhXpNP2qHoz+V3yGZSmIpwiB/hs6Yoe1pgYxw3YY
         gQeSjVctKE0NmrknZnOU7l7M/BIcslz/+gAqbi8WRWsh2epQbtVo/6FixXT6YA5uUHKM
         fddgPRtERc5Rv0tOAtxNRQ0l4xIkxJT4YYKHmR/T2DJ7OhePMUlpP92zPdXAMMR0cgG6
         /mcw==
X-Gm-Message-State: ACgBeo2unvkntjtVXZM+p0J3UGDd6Ld8rpPDE19yJzbfKz1s/dZXPBl7
	r9Sy9LCUa6tzrsoUmhqIA38PCuNkPYDR37Ci
X-Google-Smtp-Source: 
 AA6agR6z0LGn3ZZise63+P7za2hQY+cLgvbzzOPlTBQ7e9MPsBrrsI4NAMs4W9XVmgxVUexjiFNq1A==
X-Received: by 2002:a05:622a:10:b0:344:6381:3704 with SMTP id
 x16-20020a05622a001000b0034463813704mr9457452qtw.441.1661002111167;
        Sat, 20 Aug 2022 06:28:31 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bk26-20020a05620a1a1a00b006bb29d932e1sm5869783qkb.105.2022.08.20.06.28.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 06:28:30 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	"vishnu.banavath@arm.com" <vishnu.banavath@arm.com>,
	Ross.Burton@arm.com
Cc: nd@arm.com
Subject: Re: [PATCH 0/1] arm/optee: update optee-client to v3.18
Date: Fri, 19 Aug 2022 15:30:21 -0400
Message-Id: <166093742254.3928108.5928874125203119242.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220816131434.26265-1-vishnu.banavath@arm.com>
References: <20220816131434.26265-1-vishnu.banavath@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sat, 20 Aug 2022 13:28:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3706

On Tue, 16 Aug 2022 14:14:33 +0100, vishnu.banavath@arm.com wrote:
> This change is to update optee-client to v3.18
> 
> Vishnu Banavath (1):
>   arm/optee: update optee-client to v3.18
> 
>  meta-arm/recipes-security/optee/optee-client_3.17.0.bb | 3 ---
>  meta-arm/recipes-security/optee/optee-client_3.18.0.bb | 3 +++
>  2 files changed, 3 insertions(+), 3 deletions(-)
>  delete mode 100644 meta-arm/recipes-security/optee/optee-client_3.17.0.bb
>  create mode 100644 meta-arm/recipes-security/optee/optee-client_3.18.0.bb

Applied, thanks!

[1/1] arm/optee: update optee-client to v3.18
      commit: f85bec2a1922885f0a625bd89b9ffae83d8f9e79

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

