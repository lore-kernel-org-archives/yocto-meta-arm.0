Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68F08C433FE
	for <webhook@archiver.kernel.org>; Fri, 11 Feb 2022 15:49:54 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web11.8762.1644594587302670636
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 07:49:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=vcq+Pqg4;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.219.44,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qv1-f44.google.com with SMTP id o5so8853839qvm.3
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 11 Feb 2022 07:49:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=J23a3SOtbeLxbzVKYZttVJYmhmPDkoTQshajAqBVP2U=;
        b=vcq+Pqg49sJKNYE3mnqNRXHoHrp6pk9PAA/CycnlLj+E2g0poFjGCfchGUU7eFAned
         e7WoL4fx7QdOqtA2yKa9LiyhDiSjX5yMihithZCvU3dPJKHQZPPw85sNITqRKV3rW6xz
         xe4Qe1LPx+oOMkX865VdPgVqlDx0qY9zVCRGdJv9jMpJ0LuqM6Ef71/kP141Rs63ZpRc
         W798gMK5Tntj35cKQ35lle9eBzzmuHM0gyXLFCPidrod/FJuR5GvLiQrM5GNFnQQMm9m
         LmSYesJaRi2sikYEW5s1u1XtJjgwatW7iuF04/oi6nnm8R+QcxsF1B0MGzOXc0wj2fa6
         J+EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=J23a3SOtbeLxbzVKYZttVJYmhmPDkoTQshajAqBVP2U=;
        b=yrvnCmatA9vITPbNdo2ALu5sQqVCH/gVA63Rbc8ou/3KfGK+n5TCdqfsRXoZKQOvC2
         aNo0KNMd/C0FRoKUxQ+dzm25ROCH41MjWOYmFotFs9sPGZdn8LR9Pckmzt5ax0omiAwZ
         bSbONmHr71hffxQRgl4yKYz1edoeUBpevH8f2lssp/jiZjB6v6efbQWhDtYL98ExceSU
         fyuWM3FYTSzxtPNKxDybDVkPR7tLmtHm2QiOgKN8rMtlM5mdGKNoZquYT0xeXdD47FU1
         4G0XRh4doboSAHEzq/KY/2mfPKOXERtAPYxVPOhRWSOYIEyqDCUSS32U83WyXgxTC7eT
         +9mQ==
X-Gm-Message-State: AOAM532QJFk2a74i2ELzT7j9h0ORwzHgfv7Cdj0QHykEFQ8IcpbHtOwV
	LgHZT04K/2vNK2+13RRB6LX7hApG5t5FEA==
X-Google-Smtp-Source: 
 ABdhPJxKXhwivuDHLvkOu9yEy795RELSfC1toJBZcZ1jp8QsT54VoHF1jzA8nb4zWlQnzZIG0Wx8Jw==
X-Received: by 2002:a05:6214:767:: with SMTP id
 f7mr1481421qvz.32.1644594586292;
        Fri, 11 Feb 2022 07:49:46 -0800 (PST)
Received: from localhost ([2605:a601:a665:9200:6bed:1ee8:a843:e258])
        by smtp.gmail.com with ESMTPSA id c2sm7679411qkp.0.2022.02.11.07.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Feb 2022 07:49:46 -0800 (PST)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross Burton <ross.burton@arm.com>
Subject: Re: [PATCH 1/4] CI: add meta-gem5 to the pending upgrades report
Date: Fri, 11 Feb 2022 10:49:16 -0500
Message-Id: <164459455940.4074336.476921293777819385.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220211114527.4157075-1-ross.burton@arm.com>
References: <20220211114527.4157075-1-ross.burton@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 11 Feb 2022 15:49:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/2992

On Fri, 11 Feb 2022 11:45:24 +0000, Ross Burton wrote:
> The gem5-arm64 machine was missing.

Applied, thanks!

[1/4] CI: add meta-gem5 to the pending upgrades report
      commit: bade8df2d882098e7a06b419e4924efd87b717b2
[2/4] gem5/gem-aarch64-native: remove duplicate --command-line
      commit: 6c410376dfd2188ee9f071a1cc4f2c8cccc25d07
[3/4] gem5/linux-yocto: use wildcards in the bbappend
      commit: e5334bfabfbb5ea6d0a6819d62085f58520c6181
[4/4] atp/linux-yocto: use wildcards in the bbappend
      commit: 31446384e6dfa9d0bbf26ebe11adbff8250a3964

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

