Return-Path: <jdmason@kudzu.us>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AC0BC19F2C
	for <webhook@archiver.kernel.org>; Sun, 31 Jul 2022 03:06:48 +0000 (UTC)
Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com
 [209.85.222.174])
 by mx.groups.io with SMTP id smtpd.web08.9705.1659236806795713518
 for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 20:06:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@kudzu-us.20210112.gappssmtp.com header.s=20210112
 header.b=YXsb7fmi;
 spf=none, err=permanent DNS error (domain: kudzu.us, ip: 209.85.222.174,
 mailfrom: jdmason@kudzu.us)
Received: by mail-qk1-f174.google.com with SMTP id o1so6273003qkg.9
        for <meta-arm@lists.yoctoproject.org>;
 Sat, 30 Jul 2022 20:06:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kudzu-us.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=QCXl21F0VXPTqzsSYys5pS2HmNG9pswhmDR++Jy4KVU=;
        b=YXsb7fmimOfIhaLozCwBLW5APAOeIcMgXQry7yBkJeNilSCNXpaekUYU+ekyhoJqjD
         gRiZBuTmHPMAsDCxt8IfsCU90qNm1PDFtgpLux5gahuVwudHmnqbpNWbCnbzy28hFhff
         yUOPo+FZBsDI7BhpQUL0evaqLDqn2BzZaFk4mJOldNOnKZYiaJ3z4OOXyBRDsa7d++rk
         ZYjl/7F7ZbDOIqFcV0/mIqyC+D7jxQ3GlwppMzxd3FmYx2a0DGTf9/fgQcBggMglRxO+
         K44VtrzNrHXeaPqOC4AzCOvgDYy/T2NWBdBeVfj9uCCTX8SeF3nEEqkPgmVgegZGDZLo
         ylAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=QCXl21F0VXPTqzsSYys5pS2HmNG9pswhmDR++Jy4KVU=;
        b=mdn+7u3Cb0/LD+YeZZTXse5X6pGvagURTXGtVKEG33pCNK8cZK0XuyquGyU0pvHNyJ
         zM6BiL+xeeNA/O2Gq7e6EI1FjMp4r42Z+bR/fih5D3T0tKy/9kVtsUs/8w6IzcaseU99
         a+k8WdaIHH7WUa6jymXdPepDwUIL8OCDNpysGiJeLScCh7g3sJ2g3DwAnKuVNBw4VYIA
         6Wpq+dUtI7Z7G9kRt6Al4k4hw8WOYVguHDUmHthZ01OC6OeaE6K373RyxIMCkrizZrx/
         +F0EgO7HZbIUfHMCiMZEaoSwbaSn2EB3oipOZrQwqp0kTjo9qforK8E9uwNDP2gbvFTZ
         fmTA==
X-Gm-Message-State: AJIora+knPxw4SxmgHpc1ui0DQoxmMuLgnV3nO261XGH3ybeDuw8DkVF
	rwbgCkusxfFwabZiqdx0GCjNxGmmTXci7g==
X-Google-Smtp-Source: 
 AGRyM1t4037MMtlRD0ggiGKpmN/ZdZkb2XfXx6hULpOkw0UrIpYVmATwn+AQbkFXfhVKbjyuwPrcMw==
X-Received: by 2002:a05:620a:2912:b0:6b5:e5b0:3dcf with SMTP id
 m18-20020a05620a291200b006b5e5b03dcfmr7958180qkp.506.1659236805475;
        Sat, 30 Jul 2022 20:06:45 -0700 (PDT)
Received: from localhost ([2605:a601:a608:5600::59])
        by smtp.gmail.com with ESMTPSA id
 bq11-20020a05620a468b00b006b5d9a1d326sm5834982qkb.83.2022.07.30.20.06.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Jul 2022 20:06:44 -0700 (PDT)
From: Jon Mason <jdmason@kudzu.us>
X-Google-Original-From: Jon Mason <jon.mason@arm.com>
To: meta-arm@lists.yoctoproject.org,
	Maciej Borzecki <maciek@thing.com>
Cc: Ross Burton <Ross.Burton@arm.com>,
	Jon Mason <jdmason@kudzu.us>
Subject: Re: [PATCH kirkstone] arm/edk2-firmware: cherry pick gcc 12.x
 compatibility patches
Date: Sat, 30 Jul 2022 23:05:44 -0400
Message-Id: <165923674540.386450.12988175462820733519.b4-ty@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: 
 <f52602b7b2e1fe128da873eb2d9bb6a9639aff9c.1659117922.git.maciek@thing.com>
References: 
 <f52602b7b2e1fe128da873eb2d9bb6a9639aff9c.1659117922.git.maciek@thing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: <meta-arm.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arm@lists.yoctoproject.org>; Sun, 31 Jul 2022 03:06:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arm/message/3627

On Fri, 29 Jul 2022 20:05:51 +0200, Maciej Borzecki wrote:
> Cherry pick gcc 12.x compatibility patches from the upstream.

Applied, thanks!

[1/1] arm/edk2-firmware: cherry pick gcc 12.x compatibility patches
      commit: 29dc2147d755c4f8089404d6993546608616a966

Best regards,
-- 
Jon Mason <jon.mason@arm.com>

