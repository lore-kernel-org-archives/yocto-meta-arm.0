Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3C7CC77B73
	for <webhook@archiver.kernel.org>; Wed, 19 Apr 2023 23:40:02 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.53572.1681947599148833663
 for <meta-arm@lists.yoctoproject.org>;
 Wed, 19 Apr 2023 16:39:59 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=qi/5swZK;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.160.171, mailfrom: jdmason@kudzu.us)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-3ef38864360so925181cf.2
        for <meta-arm@lists.yoctoproject.org>; Wed, 19 Apr 2023 16:39:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1681947598; x=1684539598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xc1QL9IudmHaH8nYWxujXGQC+PpvZeOLgqDGC+DCmSk=;
        b=qi/5swZKxiyecX5HGXc25yYJNnFG12pB8Wv04h8162B9YwI5O8RN+3WYMPHtN4Br9c
         1IGMtAbpIWYm9pT6iwOgDvGlCyqxRlUm4ldHU9uxsr6ZJO9pcjwQJYxM5tdrjyVpfYrm
         M6BC9qhcmxnMGWOiK9LgduHIMd8XWfTSGeO89WIQ+ZvanGXWCplCQxZiO1PtqgeAYojr
         jCjvzRGck7EanbCB9a9x+00BeRh9mRN4Rpa6X7LTKkvaYFUlbFYMgALFFB4+XwxxRLZ0
         NYWcD/0/TkGo13UI2Th7KwSD9QPDcR38E3Z3L2Gd6gm6Ljw6heoOMr1Bfm/2Gq964kZs
         60hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681947598; x=1684539598;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xc1QL9IudmHaH8nYWxujXGQC+PpvZeOLgqDGC+DCmSk=;
        b=WZDWqMld0WGKqbZGy5GVb9HbKdtIQoy73lBPmh30DV4JkK5NwU2mO25cH1fkm07opv
         aUG/GPhx6R42vCP2xOso/TzlbgmUxIeE/FR4/SPbUKTdBOYIakG11FeqK1oTSpXYVVAo
         QWH+0q/3vYTsXU/TpV1bbLtE/hER1d8YvaWMcXBmtf5wjD0aE8ktH7E7rg+nAIjWLntf
         LV5crMuUGjURg8/BdA15+p5Kt43reGcTPZbjQ6sZ/Dqgppax9XZPzhlnB6T3vo1fTUKn
         feF8pl9PwShVkeoz3m40G4VyR4gjCawvaMK45xTRtMil1n2Lbi9eXIeXY0dLuG74I/Bt
         rn8A==
X-Gm-Message-State: AAQBX9d1ujnzk0vkSMG83XNLZDPJ12sq6ElQxBX3T2+osUyUALPL1ubH
	P1p5XASGCvXmY8q9LGFd9XdLNv7EVohxj3BnfOM=
X-Google-Smtp-Source: AKy350aO1GpqFhJzeyXA0OLVrUok9LDGulY5maDAKjPCXuE0rh4Qe8X5Hq2G4V6DmE663lyAAne0TA==
X-Received: by 2002:ac8:7f86:0:b0:3ef:4a6c:f9d2 with SMTP id z6-20020ac87f86000000b003ef4a6cf9d2mr382627qtj.60.1681947597902;
        Wed, 19 Apr 2023 16:39:57 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id bp41-20020a05620a45a900b00748613be2adsm5553qkb.70.2023.04.19.16.39.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 16:39:57 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Peter Hoyes <peter.hoyes@arm.com>
Cc: Peter Hoyes <Peter.Hoyes@arm.com>
Subject: Re: [PATCH] arm/scp-firmware: Add support for components other than SCP, MCP
Date: Wed, 19 Apr 2023 19:39:28 -0400
Message-Id: <168194756810.238245.14313133137020614176.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230419163052.473096-1-peter.hoyes@arm.com>
References: <20230419163052.473096-1-peter.hoyes@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Wed, 19 Apr 2023 23:40:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4589

On Wed, 19 Apr 2023 17:30:52 +0100, Peter Hoyes wrote:
> SCP-firmware may build components other than the SCP and MCP. Make the
> MCP branch of the do_install task more generic to suport this.

Applied, thanks!

[1/1] arm/scp-firmware: Add support for components other than SCP, MCP
      commit: 0b528b731aef8acb4bd67664d2c31315151e798d

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

