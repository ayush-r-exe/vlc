/*****************************************************************************
 * VLCLibraryWindowPersistentPreferences.m: MacOS X interface module
 *****************************************************************************
 * Copyright (C) 2023 VLC authors and VideoLAN
 *
 * Authors: Claudio Cambra <developer@claudiocambra.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston MA 02110-1301, USA.
 *****************************************************************************/

#import "VLCLibraryWindowPersistentPreferences.h"

NSString * const VLCLibraryWindowPreferencePrefix = @"VLCLibraryWindow";

@implementation VLCLibraryWindowPersistentPreferences

- (NSString * const)fullLibraryWindowKey:(NSString *)partialKey
{
    return [NSString stringWithFormat:@"%@.%@", VLCLibraryWindowPreferencePrefix, partialKey];
}

- (const NSInteger)libraryViewModePreferenceWithKey:(NSString *)key
{
    NSUserDefaults * const standardUserDefaults = NSUserDefaults.standardUserDefaults;
    NSString * const fullKey = [self fullLibraryWindowKey:key];
    return [standardUserDefaults integerForKey:fullKey];
}

- (void)setLibraryWindowViewModePreferenceWithKey:(NSString *)key
                                            value:(VLCLibraryViewMode)viewMode
{
    NSUserDefaults * const standardUserDefaults = NSUserDefaults.standardUserDefaults;
    NSString * const fullKey = [self fullLibraryWindowKey:key];
    [standardUserDefaults setInteger:viewMode forKey:fullKey];
}

@end
