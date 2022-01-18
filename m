Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4F3DC433EF
	for <webhook@archiver.kernel.org>; Tue, 18 Jan 2022 03:10:39 +0000 (UTC)
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 by mx.groups.io with SMTP id smtpd.web09.7869.1642475438793139045
 for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 19:10:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=EJOmydFq;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.54,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f54.google.com with SMTP id jr5so20105824qvb.11
        for <meta-arm@lists.yoctoproject.org>;
 Mon, 17 Jan 2022 19:10:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cTnzfpmhKMYjCXWESfs+97l17n8yA2Nug4yyaCxHSL0=;
        b=EJOmydFqVQKxNaWkRuryIe985gn9ZRiKK4t5PuCcC5GOaFIfUjnKT9YyabVH0O5g/5
         XRG1JgVEb1xtz2cPFb+0e85elO8ETbmVEaGnPPy9Ze27sH9GqbeXZ4UuyH0+OuYeg9p+
         GdvuuhSZRX8B8mv+4tXQI0UMvtHxyKKNbWlomlqcy5iS9sZBaMbyN5H0jbbpWrQTGoN7
         aFMfx2z9gU+eDuyygD8VHlBs8vEpuCNATMHdKvp3qwDDbEnRdZV4GC/aUeQBWaKfm3fi
         7E6b7NmLzg1hn7SQYl8XPcXwt12eiHMuLbsl3NG1hbcVwFwvbJRMsMhDvM305Pp/19J6
         pVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cTnzfpmhKMYjCXWESfs+97l17n8yA2Nug4yyaCxHSL0=;
        b=HMWe2XUYFEpqD9/jl73luUzrBC9azn1QYF7euRkoKD5O8ev5UQnVkAcJfOT2K/oTTl
         s0pw2DfSfEPbK2NfMFCW4GjvfHt0BR1kpc7kAvKTR0uTGV4rsIWNme5Rpz8LvP4qPEuM
         iB4BdVj0OJUuZHwODtntp+y1xltygkjG9/EDp6vWF1cJ1AxlU8Xm+L+0XKbOKUofDnXb
         mg2ZDlBDmdw0FtOQZoubYJ8HNvp7ifv2RYQjoQbkZdSyS9NWizMIP8b0rmnUQO0aRlxy
         iZeqwmODhM89CKTWRkKy7Py9gXzNsiWcpQjG6NxrrPPQfOzvzkVUTN4qGEeX6tM1F6Bw
         Gt5A==
X-Gm-Message-State: AOAM530vPA044kmEV8fcnyn46BtjFW2gVwze35LD7/3FodVxAARf10kN
	YmiL2m9wZFlo+7qttd3QJQ/gEgAR3oc+Ng==
X-Google-Smtp-Source: 
 ABdhPJw/NYNOPTqyocHicnfj434ucSYC0NofeVl/k7djzf9PJ1/pg+xweIjrY1lPG5GR2+QgiJkg0g==
X-Received: by 2002:ad4:5c67:: with SMTP id i7mr21347704qvh.18.1642475437826;
        Mon, 17 Jan 2022 19:10:37 -0800 (PST)
Received: from localhost ([2605:a601:a63c:b500:ff9b:992d:3671:5cb2])
        by smtp.gmail.com with ESMTPSA id
 d3sm4500994qte.76.2022.01.17.19.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Jan 2022 19:10:37 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"vishnu.banavath@arm.com" <vishnu.banavath@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/2] arm-bsp/tf-m: fix capsule instability issue for
Date: Mon, 17 Jan 2022 22:10:34 -0500
Message-Id: <164247543503.1092825.11427266996922606405.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220117182007.38178-1-vishnu.banavath@arm.com>
References: <20220117182007.38178-1-vishnu.banavath@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Tue, 18 Jan 2022 03:10:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2850

On Mon, 17 Jan 2022 18:20:05 +0000, vishnu.banavath@arm.com wrote:
> This change is to upgrade TF-M to latest git hash which contains
> fix for capsule instability issue for corstone1000 platform.
> 
> Latest TF-M would also require v3.1 mbedtls. Also updated git hash
> for mbedtls repo.
> 
> Vishnu Banavath (2):
>   arm-bsp/tf-m: fix capsule instability issue for corstone1000
>   arm-bsp/uboot: fix null pointer exception for get_image_info
> 
> [...]

Applied, thanks!

[1/2] arm-bsp/tf-m: fix capsule instability issue for corstone1000
      commit: c30d90a77d78279eb07549bdada011e960328c46
[2/2] arm-bsp/uboot: fix null pointer exception for get_image_info
      commit: e15df2738e41e22b653f0f55c3e76ffc076a98f9

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

