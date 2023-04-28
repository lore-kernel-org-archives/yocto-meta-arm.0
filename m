Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7EDAC77B7E
	for <webhook@archiver.kernel.org>; Fri, 28 Apr 2023 18:50:50 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web11.28895.1682707846293952456
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 28 Apr 2023 11:50:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@kudzu-us.20221208.gappssmtp.com header.s=20221208 header.b=UOGZyiWc;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178, mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-74fc1452fbdso11857785a.2
        for <meta-arm@lists.yoctoproject.org>; Fri, 28 Apr 2023 11:50:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20221208.gappssmtp.com; s=20221208; t=1682707845; x=1685299845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/uGzmK+NiuCeiUGfXeP5GugSgIMDzIlLmwhZt2lggi4=;
        b=UOGZyiWcaQQ2bTkW++V015EoF+R3zMTfyfLbryzaKd3LnmXYOlCmXEhb4mY9Rm+ZGk
         +FnpsWWcob94cx1WDPGarjAfyIlwXDQC+VVIp3NArGI7bMDehhIpWKpEaAX9D9asWGkT
         gcOwmnHjyqfa2kmZEZWUiuEQMwxuRkwMSeofJHjqNWrn6ad39vRoWh/Hf8JnRAzLOrs7
         M/V8f6Mp5TZVI0+GKBz07+TcYo/yg35BMR33DAzHmMJWEW2nRUZPkvsDhJMIpaYkBHha
         /MVqPeMDK/C3gkCppbNkwFKt9h+hUotA2L6esJ6sVwn5lrnthmnL+zBB49+q8ie9hbrC
         KtvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682707845; x=1685299845;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/uGzmK+NiuCeiUGfXeP5GugSgIMDzIlLmwhZt2lggi4=;
        b=IaLqR9vvoQNdJ0k7EPsddeO9b34Zke3gZc/FbUv65H3AczVmt9Z1lEhagBbpzHBX+n
         1OpI7N+5GV/6XN1AKC4nb2LzXINpdj4K9bwg6wD4n8b7s9VO5Zuv8ZmdUCPDXrzi/dsO
         X4vWgZp7Mf/nj1/BN5uOzsIoB5bpGnPEavV+UmX/GAxCp8qpHAs9H9nkK2klN8gAYebq
         /yTI7eU2mlgZ9xT94SDyBRZIZkSNSgbQ+G/rv01BuQvN76nT+2ajqtSJS0eBC46NXTO1
         /2jUe0KAHh+SA5jf31Ef4rdOxueXrdaliJbMCMnehH9FFhJQaULCokyvletlFh8fwtnx
         oXqg==
X-Gm-Message-State: AC+VfDwgXllfcKOnQziCipv21ZlQWBYTsO1Tz3cWOMTWLxPmWP0/IRMl
	5WO6CYfSITNFVGznq3gdy2DXbgdZerC3hW05yD8=
X-Google-Smtp-Source: ACHHUZ5i0/fueARM1EimC6DbIUp4gD83w5gKfN6mbKfscw22FZamlkmRqUw6NqAZKa7qze9rLBKovA==
X-Received: by 2002:a05:622a:1806:b0:3e6:55b2:35e with SMTP id t6-20020a05622a180600b003e655b2035emr11058915qtc.26.1682707844977;
        Fri, 28 Apr 2023 11:50:44 -0700 (PDT)
Received: from localhost ([2605:a601:a600:7900:8ac9:b3ff:febf:a2f8])
        by smtp.gmail.com with ESMTPSA id y18-20020a05620a09d200b0074bcf3ac7casm6906647qky.44.2023.04.28.11.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Apr 2023 11:50:44 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Jon Mason <jon.mason@arm.com>
Subject: Re: [PATCH] arm-bsp/tc1: disable signed kernel image
Date: Fri, 28 Apr 2023 14:50:36 -0400
Message-Id: <168270783610.3573513.4256459037866610004.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230428145638.3261549-1-jon.mason@arm.com>
References: <20230428145638.3261549-1-jon.mason@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 28 Apr 2023 18:50:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/4626

On Fri, 28 Apr 2023 09:56:38 -0500, Jon Mason wrote:
> The signed kernel image for the android kernel and legacy u-boot is no
> longer booting.  Remove this to allow for it to work until it can be
> fixed.

Applied, thanks!

[1/1] arm-bsp/tc1: disable signed kernel image
      commit: c60d7865ddeb49578e949462ab184940be3b6913

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

