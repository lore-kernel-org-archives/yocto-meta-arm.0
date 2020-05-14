Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web10.8250.1589443846519830948
 for <meta-arm@lists.yoctoproject.org>;
 Thu, 14 May 2020 01:10:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20150623.gappssmtp.com header.s=20150623 header.b=sJFeDr5n;
 spf=pass (domain: burtonini.com, ip: 209.85.208.195, mailfrom: ross@burtonini.com)
Received: by mail-lj1-f195.google.com with SMTP id e25so2487548ljg.5
        for <meta-arm@lists.yoctoproject.org>; Thu, 14 May 2020 01:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CZaq23uhoBwS+tmMfnM/ekTiDQTu0Mq09eRIi0fes0I=;
        b=sJFeDr5nRfJ+dgmmX4d2l8jGdQfsIwLrjGhC2qJ2IMk+EN1uut9C4NG5Xhmm27bwF9
         7nn2dGpSqgy2hq/5OvaYx4WNzjC0n8q3XwHQt84SgdrQMzZeeQm33ndapCzp+zRhraHn
         +tgQkh9Dua1wv8NmlX4USLVWWKxFIwG1q0LUWDLdphQc0Lj4XPArjlg76W/cMLX398Wv
         g1zWLz0O5fu6jr5HnYz5RPxQnvL3gNEwz85YSndK8F8DdZjDxudSx7xTEmuRfyDz+pwk
         TS6c4MGt+kfV56aS9bDe1oGq+RK0g0wAkVjoPC6KeLnJdXV47hHFG7J0WR8HBDCiRpO4
         eL5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CZaq23uhoBwS+tmMfnM/ekTiDQTu0Mq09eRIi0fes0I=;
        b=E/IhAPDEnR0ctbJJVwE5WebLRsJ1vbytOccd+lHcz58+s4fDtMWIh2+14YV67HL0Da
         5SXENpSrT7rmcO1gsb26oubSGoslQYIGV/W9bKgwg7zgoeVuWGycaXJgFDYs8v1sjUCX
         0SMUCEKH5IQp3HvrV631hTn0KbnbB4lkFn1W+UETKCMsSyp8IMlmKev/wCwPbLGMDqZn
         qU6bHUiPlQc+MCYSDa6wiOu+l8YIriUXT2Gc69JNZee6dZFHTqBIxFy0lr6HJtbdx6Sr
         tIiAICkAtRBUxXmrfstBrZ/mogwsMtvqoLwwGXbLiEMfszsJW/uoc+Vhsu1rP8BALhWM
         IWbQ==
X-Gm-Message-State: AOAM533I487X7fDKBxEcAaBFNfdm0t+AMsJTau9WBAtle8FaS51PscwY
	gwr5yvHKHjdq6niuGKE4ivS5xYEjagqoQHVGud/3eQ==
X-Google-Smtp-Source: ABdhPJwaiYtJmX7pPjcs7KCrUiPIss3b3F+irSOek4qcSd3FG+RRaS2yDk1Ae7wmrmohoc5MhQ13Crvez+R3ehYoFwY=
X-Received: by 2002:a2e:8658:: with SMTP id i24mr1802970ljj.287.1589443844557;
 Thu, 14 May 2020 01:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200514024932.19962-1-jdmason@kudzu.us> <20200514042513.GY11927@denix.org>
In-Reply-To: <20200514042513.GY11927@denix.org>
From: "Ross Burton" <ross@burtonini.com>
Date: Thu, 14 May 2020 09:10:33 +0100
Message-ID: <CAAnfSTuU5Yc9ch52kRm2i64FsQ1e-o11Gf8ZrRg-0_SKCOT-3w@mail.gmail.com>
Subject: Re: [meta-arm] [PATCH] arm-toolchain: gcc-arm-none-eabi-native: Add recipe
To: Denys Dmytriyenko <denis@denix.org>
Cc: Jon Mason <jdmason@kudzu.us>, meta-arm@lists.yoctoproject.org, 
	Joshua Watt <JPEWhacker@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Thu, 14 May 2020 at 05:25, Denys Dmytriyenko <denis@denix.org> wrote:
> What the hell is "lnr"? :) What am I missing?

It's a script in oe-core/scripts that is basically a clone of 'ln
--relative', as it's a really useful feature that isn't available on
some old but supported build hosts.

Old but supported at the time that is, I do wonder if those hosts are
no longer supported.

Ross
