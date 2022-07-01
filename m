Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50360C433EF
	for <webhook@archiver.kernel.org>; Fri,  1 Jul 2022 13:30:38 +0000 (UTC)
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com
 [209.85.222.178])
 by mx.groups.io with SMTP id smtpd.web12.38412.1656682230814113381
 for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Jul 2022 06:30:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=6cVeEK0P;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.178,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f178.google.com with SMTP id b125so1783783qkg.11
        for <meta-arm@lists.yoctoproject.org>;
 Fri, 01 Jul 2022 06:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=85K/iGuiiXOPdm85gdT4ZGWzQ/YP3f8LlBbG9cSCnfY=;
        b=6cVeEK0PE2XxvtBI3NMtWwaREKRE2GAJInPCLXuHL5bFyy1gLcpiDM4snXSc+IJ3wg
         0ZeUlIxkeVL0UpOL9mR/xqy9JoNffRUUoLOd/kg4xuKjUjuXVjz1QB0vSOkn+fkjmDQ4
         vpGmqUTFlnZi73RuSsDOHEtbwXT9xaSf06VUthKnjmqNELMfw7PtZF6LDBQQohQBe81W
         tOk9wi+9I7USV6FQGyMdDnveSUiO1M9eSMA3HCDVr1KyvEsILqV/AV80LtCL+ZLrwAq8
         ZrHLkZZxXAOHo3YuuikeEhkhVCudm4jnQYNk6XsocA5ZBRaoDh9Ug0Z5GtSCL9AoCD39
         Saxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=85K/iGuiiXOPdm85gdT4ZGWzQ/YP3f8LlBbG9cSCnfY=;
        b=i9NJF9Wk9NOODWeU1NrJCteCnJElsdfhcuC7ccSXJ3eUvpgqeQBbtto38JuwX0GTVC
         ypRKgUlO+au2vd/ov49y3MeuTYwrWf9fKqWgc1eETqRkQPZg1e1OLz3pbx+aNvuhaYDS
         W0+2O9wgUYq7AXswILZfUzBzyP3QsJG6naKtCK6ZXcg7x5Le//6O0oBsyG9k4ZdRLfhc
         ou9TYLv94XrMA+xSer01TeNXFU2M8ndRRIB01tAQbS8RstyAaRheFukFEORB7ITi58y+
         XKNyuCNtzrJuVD2av7OEz9TFGemw83fm9crxSaPy/0C9LGyeeuywOhFvA85s2ggHsr65
         iNYg==
X-Gm-Message-State: AJIora+x59otqAe+BEakH3lD7ScGkNpwrQayHg8f5YiLPzA+okCpKCM9
	6/DC8mxs9ABYZw1VySNodZkLq7OQt7+BVw==
X-Google-Smtp-Source: 
 AGRyM1vgnyEZmUGJ36rQ0GJjPsQSsC9hqcKPukzS92vstg7hx269WnOMEw/onvM4waaHUiwFqWsEvg==
X-Received: by 2002:a05:620a:9d2:b0:6af:f0b:127c with SMTP id
 y18-20020a05620a09d200b006af0f0b127cmr10340320qky.746.1656682229440;
        Fri, 01 Jul 2022 06:30:29 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 m5-20020ae9e005000000b006af1f0af045sm12503296qkk.107.2022.07.01.06.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 06:30:28 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Ross.Burton@arm.com,
	"adam.johnston@arm.com" <adam.johnston@arm.com>
Cc: nd@arm.com
Subject: Re: [PATCH 0/4] arm-bsp/n1sdp: N1SDP Trusted Boot
Date: Fri,  1 Jul 2022 09:25:52 -0400
Message-Id: <165668195187.2703887.5717065694239138242.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220630094333.3738129-1-adam.johnston@arm.com>
References: <20220630094333.3738129-1-adam.johnston@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Fri, 01 Jul 2022 13:30:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3548

On Thu, 30 Jun 2022 10:43:29 +0100, adam.johnston@arm.com wrote:
> After recent TF-A 2.7 update in meta-arm, the N1SDP cannot boot.
> The workaround was to pin TF-A to 2.6 for the N1SDP.
> 
> This patch:
> - reverts the previous workaround
> - re-configures the N1SDP for trusted boot
> 
> [...]

Applied, thanks!

[1/4] arm-bsp/n1sdp: revert "fix boot due to TF-A 2.7 update"
      commit: 893c884b061f1309b709a39ecbd50957327db537
[2/4] arm-bsp/trusted-firmware-a: N1SDP trusted boot
      commit: 996e82250e47c71397ea33b90087b23233b2a596
[3/4] arm-bsp/scp-firmware: N1SDP trusted boot
      commit: eaf0fdbdbfb666ae913edfad2c1ab616149bb29f
[4/4] arm-bsp/sdcard-image-n1sdp: N1SDP trusted boot
      commit: 8a0a9c3d32f1f3342377e50ed47c5209862c76f8

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

