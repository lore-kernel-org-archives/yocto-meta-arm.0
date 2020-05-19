Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web10.5261.1589918646589215756
 for <meta-arm@lists.yoctoproject.org>;
 Tue, 19 May 2020 13:04:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=FJcswasF;
 spf=pass (domain: konsulko.com, ip: 209.85.210.48, mailfrom: paul.barker@konsulko.com)
Received: by mail-ot1-f48.google.com with SMTP id 63so567834oto.8
        for <meta-arm@lists.yoctoproject.org>; Tue, 19 May 2020 13:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=/j4njyJavC62jfsHDpz3YTUhbgLVN5T1PPIgVZ4wBQA=;
        b=FJcswasF2xiYMnxy3KPou9FkD1dlu0R7s4DKTqOZgJ5W4cnOrkU/o8iWi4BgMxpOp4
         Oy6rJFiV+Nb3cyapNuvKY7/1PLWo/b1LoWWEIAKa7lQ4AUgum3wbbkeJwzIsuX6nNM4G
         2tnVAF28mghJQbIqlPrsT2BWCJvZxQlHOidfk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=/j4njyJavC62jfsHDpz3YTUhbgLVN5T1PPIgVZ4wBQA=;
        b=DqcWhAUparhXbLb8m+hDyO6aR10CeSd3dyWykQ7bsIG4XNY0j/M+GBcWvDNQWmmyNU
         vfwfq56JwBZPeQrb8KWw5BzdOS3ddkJFvTlDCtDDnL+LE7V95mu5yZNRafOou+3XAz+I
         7rx5mc9DRbfQdV8TKN/SF6Y6rAEhwST4gMStgpGokgF2mC/6EoRBdpdX00ME2cHDdy1C
         cyvEZljEyRn527EEQKAWcKmuw+2Wo0YWhcI263nL9tah7cL6NqcKtfFrlNCNZQJKlUE4
         OE1bmfhXOZibPWgYrECrQPYLW+wUYUjPR7VABwZGNtGQ7MyhspUveVi1IJISZKrc9L76
         ru/g==
X-Gm-Message-State: AOAM530T1eEZcbzwOPlq9ee9v91vw/QtMPSzteqEXQh0rlP6Yhp+Rz6l
	NZ6w83UgyE2/WPe+0hQprjfwq1z7G5naaRocw70t63uxYxc=
X-Google-Smtp-Source: ABdhPJwR7OdUZ5NoasaJbocFHz7iBtDDYeyEN889e/A4gHInHtnPqXuJ1tH33rz4H8Lo8ahyDgikBEE3lw4XS0qprcI=
X-Received: by 2002:a9d:518b:: with SMTP id y11mr639706otg.258.1589918645484;
 Tue, 19 May 2020 13:04:05 -0700 (PDT)
MIME-Version: 1.0
From: "Paul Barker" <pbarker@konsulko.com>
Date: Tue, 19 May 2020 21:03:53 +0100
Message-ID: <CAM9ZRVsJ8msdRBYHPg9D2ZytQox5yNCqjqvjcb9W-9bE3yHSug@mail.gmail.com>
Subject: External toolchain support
To: meta-arm@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

Hi all,

As discussed on the Yocto Project call today it's great to see the ARM
toolchain recipes moving forward under the new meta-arm layers. I've
had some issues in the past with the external pre-built toolchain
which really need fixing to properly integrate this toolchain into
projects. I'm raising them here in the hopes that these can now be
fixed.

1) Maintaining GPL compliance while using an external toolchain

The Yocto Project has an archiver class which can be used to collect
the source code of all packages built by bitbake which is a
requirement for meeting the terms of the GPL. However for the external
toolchain recipes the "source" is the pre-built toolchain archive
downloaded from the ARM website. As the pre-built toolchain includes
glibc (which is then distributed as part of the images we build) what
we need is the actual source code used to build the various toolchain
components.

The toolchain recipe needs to include some link to the actual upstream
sources and the archiver class in oe-core probably needs extending to
support this.

2) Building an SDK/ESDK

If an SDK is generated for an image built with the pre-built toolchain
then there can be some confusion about what exactly should provide the
gcc binary and various headers. In the past I've had to hack
components out of the SDK after it is built and then tell customers to
install the pre-built toolchain alongside the SDK in order to get a
working cross-compiler. Ideally everything should actually get
packaged into the SDK so that only one download is needed and no
hard-coded paths are used.

Additionally, running the populate_sdk task often fails due to missing
packages (libatomic-dev right now) and it looks like the recipe
bitrots fairly quickly after each fix. SDK generation needs to be
regularly tested and it needs to be confirmed that these SDKs can
actually cross-compile working binaries.

3) Toolchain recipe is effectively split between meta-arm & meta-arago layers

The bbappends carried in meta-arago fix items which are missing from
the external-arm-toolcahin recipe in meta-arg (e.g. the installation
of the ldconfig binary). That effectively splits the recipe over
multiple layers as these things are pretty fundamental parts of the
external-arm-toolchain recipe. An effort needs to be made to merge all
this together and have the base recipe well tested.

4) No example configurations or visible test matrix

The meta-arm-toolchain layer lacks a README or other file providing
some examples of working build configurations which use the pre-built
toolchain. It's unclear which MACHINEs and DISTROs are regularly
tested and are well supported. The best way to solve this would be to
actually store the test scripts and configurations in this layer and
use a publicly visible CI system like Travis, GitLab CI, etc to run
the tests. That would increase confidence in the pre-built toolchain
and make it clear what is supported and how frequently it's tested.

5) LICENSE is incorrectly stated in the external-arm-toolchain recipe

The full license of the toolchain package needs to be specified. Right
now all packages are marked as having the MIT license which is
obviously not correct for most of them.

Apologies for the long rant but I hope this is useful to highlight
some of the issues seen when trying to practically use the pre-built
ARM toolchain.

Thanks,

-- 
Paul Barker
Konsulko Group
