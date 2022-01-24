Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C00EC433EF
	for <webhook@archiver.kernel.org>; Mon, 24 Jan 2022 19:56:25 +0000 (UTC)
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com
 [209.85.166.172])
 by mx.groups.io with SMTP id smtpd.web09.920.1643054184095899807
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 11:56:24 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=OuL+6bMr;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.166.172,
 mailfrom: jdmason@kudzu.us)
Received: by mail-il1-f172.google.com with SMTP id y17so3338356ilm.1
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 24 Jan 2022 11:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=UYW9gn9jaiAk40tLdUF3n+VV1ZAWb4UNaObIIIOK1UE=;
        b=OuL+6bMrD98ZN71ahDK9FU3ELtXCKAs//enHeKyJXPLTnpw4AzgZby4RRv4Bsi7rBs
         GoEylVKJc7709WZ5sUwqUBdV2tXy6bDS1ee6Xx2QYY9/qt0kX8YuPEFbk9RicYosDisx
         iVR557ed2CYcLDaLGjKbJIybD3HnHrx1OXrPvpAzxQGdstf33PuWTEcqdW5Pj6LfRY0j
         KDYpfz/S4+liI279xwBLzXlURfdWBDYTI/p70l9DBshp7nX91Pwuz+IUMtZDQ/El7KPg
         eZOIxb69VqVtkJfvWKon/mz4GNaeOuUMT7RkzrOtbA30RVgv+eeSw/UQxeOeXCPWj9rz
         M+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UYW9gn9jaiAk40tLdUF3n+VV1ZAWb4UNaObIIIOK1UE=;
        b=z1RE4JqyRKPuDPPQedA1Kiv0o8s0yMbgDu0+q1uUL6BM37D3JbSg8t64suZFZbyfaz
         aCYYntoPicWSgLqh36Wu+5v8v6R/7TAA9QKrmQp928VpOrIJChaqFYCQGuo3a95a4JkF
         j5PmCcN+e+Pv3LD0np8fOPeDehU7qNadaFHmLfk1RCSVh3OLzRXviNoZ7y6ZNoejA34w
         Pp4GxQ6m2Qwc4AeAAVsLTGMX5EYvuwWyG/awekE3BZeHC4LO1CH8nwuw/kSV4e0VZNAS
         Hh7IHV5wZtjC9Nf9zHd2rYwqqTaglJXkYYHCUyhQs/91mZuG1GQ/xIdMjdLJpTSA/8S2
         HZiA==
X-Gm-Message-State: AOAM530H1dkTibuG3wFuEQVTlFw0TATVWZs6ngvrcEGal9dHnLJpeZ0c
	1mIBb2tcB8OcBroJ803qXuQRsO55p+7BUA==
X-Google-Smtp-Source: 
 ABdhPJyeZ3BUlf7mOOTWhOLM2pnFQI1fwy9izZxY2t8s2aMIlkKnvaFuFzh+T2BDNjo/cfzE27dzZA==
X-Received: by 2002:a05:6e02:2143:: with SMTP id
 d3mr10035970ilv.59.1643054183388;
        Mon, 24 Jan 2022 11:56:23 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:de27:316a:4e43:577b])
        by smtp.gmail.com with ESMTPSA id
 y4sm7765450ili.26.2022.01.24.11.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 11:56:23 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/4] arm-bsp: remove Corstone 700
Date: Mon, 24 Jan 2022 14:53:53 -0500
Message-Id: <164305403724.317553.14694805170232379049.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220124163012.3796553-1-ross.burton@arm.com>
References: <20220124163012.3796553-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Mon, 24 Jan 2022 19:56:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2907

On Mon, 24 Jan 2022 16:30:09 +0000, Ross Burton wrote:
> Corstone 700 is end-of-life, so remove it from meta-arm master.
> 
> It will remain in the stable branches for existing users, but new users
> are encouraged to use Corstone 1000 instead.

Applied, thanks!

[1/4] arm-bsp: remove Corstone 700
      commit: 92490b7fc5cd002f13337860ed34a608d4fba24b
[2/4] arm-bsp/u-boot: remove old 2020.04 recipe
      commit: 1d34798b5c5b02d59bf9a30c4ef922c46a33957d
[3/4] arm-bsp/linux-yocto: remove old 5.6 recipe
      commit: 3a8c1fd59ac3d57535b8c1ddaa36ffd0ea57d119
[4/4] arm-toolchain/gcc-arm-none-eabi: remove old 2020-q2 recipe
      commit: 558af689d5a208eb2ca0f61c0a9d140a59b10059

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

